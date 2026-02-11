#!/bin/bash
# vercel-deploy.sh

echo "=== Deploying Laravel to Vercel ==="

# Export database environment variables
export DB_CONNECTION=pgsql
export DB_HOST=ep-young-frog-ai2igjhv-pooler.c-4.us-east-1.aws.neon.tech
export DB_PORT=5432
export DB_DATABASE=neondb
export DB_USERNAME=neondb_owner
export DB_PASSWORD=npg_1gfJIC9ThbtA
export DB_SSLMODE=require

echo "1. Running migrations..."
php artisan migrate --force

echo "2. Running seeders..."
php artisan db:seed --class=AdminSeeder --force
# Add other seeders if needed
# php artisan db:seed --class=SiteSettingsSeeder --force

echo "3. Clearing cache..."
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear

echo "4. Optimizing..."
php artisan optimize:clear

echo "✓ Deployment completed!"