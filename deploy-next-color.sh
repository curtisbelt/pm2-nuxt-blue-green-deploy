#!/bin/bash

CURRENT_COLOR=$( basename $(readlink path/to/current) )
NEXT_COLOR=$( [ "$CURRENT_COLOR" == 'blue' ] && echo 'green' || echo 'blue' )

echo "Current deployment is $CURRENT_COLOR"
echo "Deploying $NEXT_COLOR"

# Prepare the next symlink as path/to/deployments/preparing-current
ln -s $PWD/path/to/deployments/$NEXT_COLOR $PWD/path/to/deployments/preparing-current

# Then atomically move it on top of (replacing) path/to/current
mv -Tf $PWD/path/to/deployments/preparing-current $PWD/path/to/current

# Change the working directory to the PARENT directory of your "current" symlink.
cd path/to/
PM2_CONCURRENT_ACTIONS=1 pm2 reload current/ecosystem.config.json

pm2 status
