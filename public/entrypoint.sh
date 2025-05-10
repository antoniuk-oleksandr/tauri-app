#!/bin/sh

set -e

# Path to the environment config file
CONFIG_FILE="./env-config.js"

# Replace environment variables in the config file
sed -i "s|__VITE_GOOGLE_CLIENT_ID__|${VITE_GOOGLE_CLIENT_ID}|g" $CONFIG_FILE
sed -i "s|__VITE_MAX_FREELANCE_BY_ID_REVIEWS__|${VITE_MAX_FREELANCE_BY_ID_REVIEWS}|g" $CONFIG_FILE
sed -i "s|__VITE_SERVICE_FEES__|${VITE_SERVICE_FEES}|g" $CONFIG_FILE
sed -i "s|__VITE_FILE_SERVER_HOST__|${VITE_FILE_SERVER_HOST}|g" $CONFIG_FILE
sed -i "s|__VITE_WEBSOCKET_HOST__|${VITE_WEBSOCKET_HOST}|g" $CONFIG_FILE
sed -i "s|__VITE_BACKEND_HOST__|${VITE_BACKEND_HOST}|g" $CONFIG_FILE


