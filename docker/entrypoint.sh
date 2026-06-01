#!/usr/bin/env bash
set -euo pipefail

export DISPLAY="${DISPLAY:-:99}"
XVFB_SCREEN="${XVFB_SCREEN:-1280x800x24}"

cleanup() {
    jobs -p | xargs -r kill 2>/dev/null || true
}
trap cleanup EXIT

Xvfb "$DISPLAY" -screen 0 "$XVFB_SCREEN" -ac +extension GLX +render -noreset &
sleep 1

fluxbox >/tmp/fluxbox.log 2>&1 &
x11vnc -display "$DISPLAY" -forever -shared -nopw -rfbport 5900 >/tmp/x11vnc.log 2>&1 &
websockify --web=/usr/share/novnc 0.0.0.0:6080 localhost:5900 >/tmp/novnc.log 2>&1 &

echo "PM Farm GUI is running."
echo "Open http://localhost:6080/vnc.html in your browser."

exec /app/program "$@"
