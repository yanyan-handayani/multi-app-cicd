#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=/dev/null
source "$SCRIPT_DIR/common.sh"

log "Starting deploy to GCP"
sync_repo
deploy_docker
healthcheck_node
reload_nginx "nginx/gcp.conf"
log "Deploy to GCP completed"