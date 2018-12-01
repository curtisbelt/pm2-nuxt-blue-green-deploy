#!/bin/bash

# Create /current symlink and start PM2
rm -rf path/to/current || true
ln -s $PWD/path/to/deployments/blue $PWD/path/to/current
pm2 start path/to/current/ecosystem.config.json
