#!/bin/bash

CURRENT_COLOR=$( basename $(readlink src/current) )
NEXT_COLOR=$( [ "$CURRENT_COLOR" == 'blue' ] && echo 'green' || echo 'blue' )

echo "Current deployment is $CURRENT_COLOR"
echo "Deploying $NEXT_COLOR"

# ------------------------------------------------------------------
# For real deployments, this is when you would update your project
# files in `$PWD/src/deployments/$NEXT_COLOR`, maybe via git pull.
# ------------------------------------------------------------------

# Prepare the next symlink as src/deployments/preparing-current
ln -s $PWD/src/deployments/$NEXT_COLOR $PWD/src/deployments/preparing-current

# Then atomically move it on top of (replacing) src/current
mv -Tf $PWD/src/deployments/preparing-current $PWD/src/current

# Change the working directory to the PARENT directory of your "current" symlink.
cd src/
PM2_CONCURRENT_ACTIONS=1 pm2 reload current/ecosystem.config.json

pm2 status
