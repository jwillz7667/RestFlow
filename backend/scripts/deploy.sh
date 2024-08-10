#!/bin/bash

# Exit on any error
set -e

# Load environment variables
source .env

# Update code from repository
git pull origin main

# Install dependencies
npm install

# Run tests
npm test

# Build the application
npm run build

# Restart the application
pm2 restart app

echo "Deployment completed successfully!"
