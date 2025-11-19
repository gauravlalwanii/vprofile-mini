#!/bin/bash
# build.sh - simple build step for CI
set -e                # exit on first error
echo ">>> Running build.sh - installing dependencies"

# move into app folder and install node deps
cd "$(dirname "$0")/../app"
npm install --no-audit --no-fund

echo ">>> Build complete"
