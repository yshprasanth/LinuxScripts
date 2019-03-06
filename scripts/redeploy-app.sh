#!/bin/bash

echo "Import the admin card created in above step (one time activity)"
composer card import --file admin@poc34-bix-app.card

if [ "$?" -ne 0 ]; then
  echo "Failed while import admin card into the network.."
fi

echo "Redeploy the bna file"
composer network update -a poc34-bix-app@0.0.1.bna -c admin@poc34-bix-app

if [ "$?" -ne 0 ]; then
  echo "Failed while redeploying bna file on the network.."
  exit 1
fi

echo "re-deploy success !!"