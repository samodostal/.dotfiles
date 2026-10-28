#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="${WALLPAPER_DIR:-$HOME/Wallpapers/elden_ring}"
INTERVAL="${WALLPAPER_INTERVAL:-10800}"

STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/wallpaper-cycle"
RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp}"
QUEUE_FILE="$STATE_DIR/queue"
HISTORY_FILE="$STATE_DIR/history"
CURSOR_FILE="$STATE_DIR/cursor"
LAST_FILE="$STATE_DIR/last"
PID_FILE="$RUNTIME_DIR/wallpaper-cycle.pid"
DAEMON_LOCK="$RUNTIME_DIR/wallpaper-cycle.lock"
STATE_LOCK="$STATE_DIR/state.lock"

mkdir -p "$STATE_DIR" "$RUNTIME_DIR"

current_wallpaper() {
    hyprctl hyprpaper listactive 2>/dev/null | sed -n '1s/^[^:]*: //p'
}

apply_wallpaper() {
    local wallpaper="$1" monitor current attempt ok
    for attempt in 1 2 3; do
        while IFS= read -r monitor; do
            [ -n "$monitor" ] || continue
            hyprctl hyprpaper wallpaper "$monitor,$wallpaper" >/dev/null 2>&1 || true
        done < <(hyprctl monitors 2>/dev/null | awk '/^Monitor / {print $2}')

        sleep 0.03
        ok=1
        while IFS= read -r monitor; do
            [ -n "$monitor" ] || continue
            current=$(hyprctl hyprpaper listactive 2>/dev/null | awk -F': ' -v m="$monitor" '$1 == m {print $2; exit}')
            [ "$current" = "$wallpaper" ] || ok=0
        done < <(hyprctl monitors 2>/dev/null | awk '/^Monitor / {print $2}')

        [ "$ok" -eq 1 ] && return 0
    done

    return 1
}

image_list() {
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
        \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \
        -o -iname '*.webp' -o -iname '*.bmp' -o -iname '*.svg' \) \
        -print0 | shuf -z
}

rebuild_queue() {
    local current="$1" path
    : >"$QUEUE_FILE.tmp"
    while IFS= read -r -d '' path; do
        [ "$path" = "$current" ] && continue
        printf '%s\0' "$path" >>"$QUEUE_FILE.tmp"
    done < <(image_list)
    mv "$QUEUE_FILE.tmp" "$QUEUE_FILE"
}

read_history() {
    history=()
    [ -s "$HISTORY_FILE" ] && mapfile -d '' -t history <"$HISTORY_FILE"
    cursor=0
    [ -s "$CURSOR_FILE" ] && cursor=$(cat "$CURSOR_FILE")
    [ "$cursor" -ge 0 ] 2>/dev/null || cursor=0
    if [ ${#history[@]} -gt 0 ] && [ "$cursor" -ge ${#history[@]} ]; then
        cursor=$((${#history[@]} - 1))
    fi
}

write_history() {
    : >"$HISTORY_FILE.tmp"
    local path
    for path in "${history[@]}"; do
        printf '%s\0' "$path" >>"$HISTORY_FILE.tmp"
    done
    mv "$HISTORY_FILE.tmp" "$HISTORY_FILE"
    printf '%s\n' "$cursor" >"$CURSOR_FILE"
}

sync_history() {
    local current="$1"
    if [ ${#history[@]} -eq 0 ]; then
        if [ -n "$current" ]; then
            history=("$current")
            cursor=0
        fi
        return
    fi

    if [ -n "$current" ] && [ "${history[$cursor]:-}" != "$current" ]; then
        history+=("$current")
        cursor=$((${#history[@]} - 1))
    fi
}

pick_new() {
    local current="$1" next
    PICKED=""
    if [ ! -s "$QUEUE_FILE" ]; then
        rebuild_queue "$current"
    fi

    mapfile -d '' -t queue <"$QUEUE_FILE"
    if [ ${#queue[@]} -eq 0 ]; then
        rebuild_queue "$current"
        mapfile -d '' -t queue <"$QUEUE_FILE"
    fi

    [ ${#queue[@]} -gt 0 ] || return 1

    next="${queue[0]}"
    : >"$QUEUE_FILE.tmp"
    local i
    for ((i = 1; i < ${#queue[@]}; i++)); do
        printf '%s\0' "${queue[$i]}" >>"$QUEUE_FILE.tmp"
    done
    mv "$QUEUE_FILE.tmp" "$QUEUE_FILE"

    history+=("$next")
    cursor=$((${#history[@]} - 1))
    apply_wallpaper "$next" || true
    printf '%s\n' "$next" >"$LAST_FILE"
    PICKED="$next"
}

reset_daemon_timer() {
    [ -s "$PID_FILE" ] || return 0
    local pid
    pid=$(cat "$PID_FILE")
    kill -0 "$pid" 2>/dev/null || return 0
    kill -USR2 "$pid" 2>/dev/null || true
}

next() {
    exec 8>"$STATE_LOCK"
    flock 8

    local current path
    current=$(current_wallpaper || true)
    read_history
    sync_history "$current"

    if [ "$cursor" -lt $((${#history[@]} - 1)) ]; then
        cursor=$((cursor + 1))
        path="${history[$cursor]}"
        apply_wallpaper "$path" || true
        printf '%s\n' "$path" >"$LAST_FILE"
        write_history
        exec 8>&-
        reset_daemon_timer
        printf '%s\n' "$path"
        return 0
    fi

    write_history
    PICKED=""
    if ! pick_new "$current"; then
        exec 8>&-
        reset_daemon_timer
        return 1
    fi
    write_history
    exec 8>&-
    reset_daemon_timer
    printf '%s\n' "$PICKED"
}

back() {
    exec 8>"$STATE_LOCK"
    flock 8

    local current path
    current=$(current_wallpaper || true)
    read_history
    sync_history "$current"

    if [ "$cursor" -le 0 ] || [ ${#history[@]} -eq 0 ]; then
        write_history
        exec 8>&-
        reset_daemon_timer
        return 1
    fi

    cursor=$((cursor - 1))
    path="${history[$cursor]}"
    apply_wallpaper "$path" || true
    printf '%s\n' "$path" >"$LAST_FILE"
    write_history
    exec 8>&-
    reset_daemon_timer
    printf '%s\n' "$path"
}

advance_new() {
    exec 8>"$STATE_LOCK"
    flock 8

    local current path
    current=$(current_wallpaper || true)
    read_history
    sync_history "$current"

    # Automatic changes discard any redo tail from browsing history.
    if [ ${#history[@]} -gt 0 ]; then
        history=("${history[@]:0:$((cursor + 1))}")
        cursor=$((${#history[@]} - 1))
    fi

    write_history
    PICKED=""
    if ! pick_new "$current"; then
        exec 8>&-
        return 1
    fi
    write_history
    exec 8>&-
    printf '%s\n' "$PICKED"
}

reset_history() {
    local current="$1"
    history=()
    cursor=0
    if [ -n "$current" ]; then
        history=("$current")
    fi
    write_history
}

daemon() {
    exec 9>"$DAEMON_LOCK"
    flock -n 9 || exit 0

    printf '%s\n' "$$" >"$PID_FILE"
    local reset=0
    trap 'advance_new || true; reset=1' USR1
    trap 'reset=1' USR2
    trap 'rm -f "$PID_FILE"; exit 0' TERM INT

    local hypr_socket=""
    if [ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ] && [ -n "${XDG_RUNTIME_DIR:-}" ]; then
        hypr_socket="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket.sock"
    fi

    # Wait for hyprpaper to create its socket.
    local current=""
    for ((i = 0; i < 50; i++)); do
        current=$(current_wallpaper || true)
        [ -n "$current" ] && break
        sleep 0.1 9>&-
    done

    # Apply the current image explicitly. This replaces hyprpaper's directory
    # slideshow setting, so this script owns the timer from here on.
    if [ -n "$current" ]; then
        apply_wallpaper "$current" || true
        printf '%s\n' "$current" >"$LAST_FILE"
    fi

    # Start each login with a fresh history containing the current wallpaper.
    exec 8>"$STATE_LOCK"
    flock 8
    reset_history "$current"
    exec 8>&-

    local elapsed chunk
    while :; do
        elapsed=0
        while ((elapsed < INTERVAL)); do
            chunk=60
            if ((INTERVAL - elapsed < chunk)); then
                chunk=$((INTERVAL - elapsed))
            fi

            sleep "$chunk" 9>&- & wait $! || true

            # USR2 (manual navigation) just restarts the 3-hour timer.
            ((reset)) && break

            elapsed=$((elapsed + chunk))

            # Exit when the Hyprland session this daemon belongs to is gone.
            if [ -n "$hypr_socket" ] && [ ! -S "$hypr_socket" ]; then
                rm -f "$PID_FILE"
                exit 0
            fi
        done

        if ((reset)); then
            reset=0
            continue
        fi

        advance_new || true
    done
}

case "${1:-}" in
next) next ;;
back) back ;;
daemon) daemon ;;
*)
    echo "usage: $(basename "$0") {next|back|daemon}" >&2
    exit 1
    ;;
esac
