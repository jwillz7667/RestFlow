#!/bin/bash

# Exit on any error
set -e

# Load environment variables
source .env

# Install dependencies
npm install

# Run linter
npm run lint

# Run tests
npm test

# Build the application
npm run build

echo "Build completed successfully!"
