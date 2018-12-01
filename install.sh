#!/bin/bash

cd path/to/deployments/blue
yarn install
yarn build

cd ../green
yarn install
yarn build
