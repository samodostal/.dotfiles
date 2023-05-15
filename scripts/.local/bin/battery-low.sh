#!/bin/bash
case "$1" in
    button/battery)
        case "$2" in
            PBTN|PWRB)
                ;;
            *)
                ;;
        esac
        ;;
    battery)
        case "$2" in
            # low battery level (10%)
            "BAT0"|"BAT1")
                if [ "$4" == "00000001" ] && [ "$5" == "00000000" ]; then
                    notify-send -u critical "Battery level is low (10%)" "Plug in your computer soon"
                fi
                ;;
            # critical battery level (5%)
            "BAT0"|"BAT1")
                if [ "$4" == "00000001" ] && [ "$5" == "00000000" ]; then
                    notify-send -u critical "Battery level is critical (5%)" "Plug in your computer immediately"
                fi
                ;;
            *)
                ;;
        esac
        ;;
esac
