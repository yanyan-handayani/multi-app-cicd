#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/multi-app-cicd"
REPO_SSH="git@github.com:yanyan-handayani/multi-app-cicd.git"

log() {
  echo "[INFO] $*"
}

ensure_app_dir() {
  sudo mkdir -p "$APP_DIR"
  sudo chown -R "$USER:$USER" "$APP_DIR"
}

sync_repo() {
  ensure_app_dir
  if [ -d "$APP_DIR/.git" ]; then
    log "Updating repository"
    git -C "$APP_DIR" pull --ff-only
  else
    log "Cloning repository"
    git clone "$REPO_SSH" "$APP_DIR"
  fi
}

deploy_docker() {
  log "Deploying docker compose"
  cd "$APP_DIR"
  docker compose down || true
  docker compose up -d --build
}

reload_nginx() {
  local conf_src="$1"
  log "Installing nginx config from $conf_src"
  sudo cp "$APP_DIR/$conf_src" /etc/nginx/sites-available/default
  sudo nginx -t
  sudo systemctl reload nginx
}

healthcheck_node() {
  log "Checking node app with retry"
  for i in {1..15}; do
    if curl -fsS http://127.0.0.1:3000 >/dev/null; then
      log "Node app is healthy"
      return 0
    fi
    log "Node app not ready yet, retry $i/15"
    sleep 2
  done

  log "Node app failed health check"
  docker ps || true
  docker logs node-app || true
  return 1
}