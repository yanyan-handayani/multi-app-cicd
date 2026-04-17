#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

log "Starting deploy to AWS"
sync_repo
deploy_docker
healthcheck_node
bash "$APP_DIR/scripts/deploy-landing.sh"
bash "$APP_DIR/scripts/deploy-django.sh"
bash "$APP_DIR/scripts/deploy-laravel.sh"
reload_nginx "nginx/aws.conf"
log "Deploy to AWS completed"