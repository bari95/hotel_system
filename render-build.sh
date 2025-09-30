#!/bin/bash

# Install PHP dependencies
composer install --no-interaction --prefer-dist --optimize-autoloader

# Clear and cache config
php artisan config:clear
php artisan config:cache

# Clear and cache routes
php artisan route:clear
php artisan route:cache

# Clear and cache views
php artisan view:clear
php artisan view:cache

# Generate application key if not already set
php artisan key:generate --force

# Run database migrations
php artisan migrate --force

# Install node modules and build assets if using frontend scaffolding
npm install
npm run build

# Set permissions
chmod -R 775 storage bootstrap/cache