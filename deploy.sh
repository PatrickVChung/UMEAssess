#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# --- Configuration ---
APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PUMA_SERVICE="puma-staging2.service" # Change this if your systemd service has a specific name (e.g., puma_umeassess)

#BRANCH="main"               # Target branch

echo "========================================="
echo " Starting Deployment: $(date)"
echo "========================================="

# Navigate to application directory
cd "$APP_DIR"

# 1. Fetch latest changes
#echo "--> Fetching latest changes from Git..."
#git fetch origin

# Check if local is behind remote
#LOCAL=$(git rev-parse @)
#REMOTE=$(git rev-parse @{u})

#if [ "$LOCAL" = "$REMOTE" ]; then
#    echo "  Already up-to-date. No deployment needed."
#    echo "========================================="
#    exit 0
#fi

# 2. Pull changes
#echo "--> Pulling updates from branch: $BRANCH..."
#git pull origin "$BRANCH"

# 3. Install/Update RubyGems
echo "--> Checking for dependency updates..."
bundle install

# 4. Database Migrations
echo "--> Running database migrations..."
RAILS_ENV=staging rails db:migrate

# 5. Precompile Assets (Crucial for Rails 8 / esbuild / Propshaft)
echo "--> Precompiling assets..."
bundle exec rails assets:precompile

# 6. Restart Puma Service via systemd
echo "--> Restarting Puma service..."
# Note: This requires the user to have passwordless sudo access for this specific service
sudo systemctl restart "$PUMA_SERVICE"

echo "========================================="
echo " Deployment Successfully Completed! 🎉"
echo "========================================="
