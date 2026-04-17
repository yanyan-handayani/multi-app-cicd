#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

log "Starting deploy to AWS"
sync_repo
deploy_docker
healthcheck_node
bash "$APP_DIR/scripts/deploy-landing.sh"

if [ -f "$APP_DIR/apps/django/requirements.txt" ] && [ -f "$APP_DIR/apps/django/app/manage.py" ]; then
  bash "$APP_DIR/scripts/deploy-django.sh"
else
  log "Skipping Django deploy: source not ready"
fi

if [ -f "$APP_DIR/apps/laravel/artisan" ] && [ -f "$APP_DIR/apps/laravel/composer.json" ]; then
  bash "$APP_DIR/scripts/deploy-laravel-aws.sh"
else
  log "Skipping Laravel deploy: source not ready"
fi
reload_nginx "nginx/aws.conf"
log "Deploy to AWS completed"