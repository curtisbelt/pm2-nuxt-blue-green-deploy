# PM2 Blue/Green Deployment Demo w/ Nuxt.js

This repo demonstrates:

- How to deploy Nuxt.js via PM2 using cluster mode
- How to execute a simple blue/green symlink strategy
- How to perform zero-downtime reloads between blue and green

### Requirements

- Bash (Tested on 4.4.23)
- Yarn (Tested on 1.12.3)
- PM2 (Tested on 3.2.2)

```bash
yarn global add pm2
```

### Instructions

**Only run the bash scripts from the project root, the scripts rely on relative paths to function.**

```bash
cd /{download_location}/pm2-blue-green-deploy

bash install.sh            # Install npm packages & build nuxt for the test application
bash deploy.sh             # Create the inital "current" symlink and start PM2 from it
bash deploy-next-color.sh  # Deploy the the next color and reload PM2
bash stop.sh               # Stop PM2 and remove "current" symlink
```
