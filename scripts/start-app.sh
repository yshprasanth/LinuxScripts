#!/bin/bash

echo "Build BNA File"
./build-app.sh

if [ "$?" -ne 0 ]; then
  echo "Failed while building the app.."
  exit 1
fi

echo "Deploy BNA File"
./deploy-app.sh

if [ "$?" -ne 0 ]; then
  echo "Failed while deploying the app, will try re-deploy"
  ./redeploy-app.sh
  
  if [ "$?" -ne 0 ]; then
    echo "Failed while re-deploying the app.."
    exit 1
  fi
fi

echo "Starting composer-rest-server"
composer-rest-server -c admin@poc34-bix-app -n never -w true

if [ "$?" -ne 0 ]; then
  echo "Failed while starting composer-rest-server"
  exit 1
fi

echo "Completed successfully !!"