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

# Deploy to production server
# Replace this with your actual deployment command
# For example, if using PM2:
# pm2 restart app

echo "Deployment completed successfully!"
