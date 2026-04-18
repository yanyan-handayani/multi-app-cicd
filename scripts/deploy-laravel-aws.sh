#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/multi-app-cicd"
LARAVEL_DIR="$APP_DIR/apps/laravel"

echo "[INFO] Deploying Laravel AWS"

sudo apt update
sudo apt install -y php8.4 php8.4-fpm php8.4-cli php8.4-mysql php8.4-xml php8.4-mbstring php8.4-curl php8.4-zip unzip composer

cd "$LARAVEL_DIR"

if [ ! -f .env ]; then
  cp .env.example .env || true
fi

composer install --no-interaction --prefer-dist
php artisan key:generate --force || true
php artisan migrate --force || true
php artisan config:clear || true
php artisan cache:clear || true
php artisan route:clear || true
php artisan view:clear || true

sudo chown -R $USER:www-data "$LARAVEL_DIR"
sudo chmod -R 775 "$LARAVEL_DIR/storage" "$LARAVEL_DIR/bootstrap/cache" "$LARAVEL_DIR/database" || true

sudo systemctl enable php8.4-fpm
sudo systemctl restart php8.4-fpm

echo "[INFO] Laravel deployed"