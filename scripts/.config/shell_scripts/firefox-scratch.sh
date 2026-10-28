#!/bin/sh
exec env MOZ_APP_REMOTINGNAME=firefox-scratch firefox --no-remote --profile "$HOME/.mozilla/firefox/firefox-scratch" --new-window https://gemini.google.com
