#!/bin/bash

cd src/deployments/blue
yarn install
yarn build

cd ../green
yarn install
yarn build
