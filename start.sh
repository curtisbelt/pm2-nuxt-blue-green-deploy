#!/bin/bash

# Create /current symlink and start PM2
rm -rf src/current || true
ln -s $PWD/src/deployments/blue $PWD/src/current
pm2 start src/current/ecosystem.config.json
