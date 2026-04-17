#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/multi-app-cicd"

echo "[INFO] Landing page ready at: $APP_DIR/apps/landing/index.html"
test -f "$APP_DIR/apps/landing/index.html"