#!/bin/bash

echo "Install Composer binary on the network"
composer runtime install --card PeerAdmin@poc34-bix-network --businessNetworkName poc34-bix-app

if [ "$?" -ne 0 ]; then
  echo "Failed while installing composer binary on the network.."
  exit 1
fi

echo "Install bna file on the network"
mv admin@poc34-bix-app.card admin@poc34-bix-app.card.old
composer network start --card PeerAdmin@poc34-bix-network --networkAdmin admin --networkAdminEnrollSecret adminpw --archiveFile poc34-bix-app@0.0.1.bna --file admin@poc34-bix-app.card

if [ "$?" -ne 0 ]; then
  echo "Failed while installing bna file on the network.."
  mv admin@poc34-bix-app.card.old admin@poc34-bix-app.card
  exit 1
fi
rm admin@poc34-bix-app.card.old

echo "Import the admin card created in above step (one time activity)"
composer card import --file admin@poc34-bix-app.card

if [ "$?" -ne 0 ]; then
  echo "Failed while import admin card into the network.."
  exit 1
fi

echo "Verify the Composer network is up and running"
composer network ping --card admin@poc34-bix-app

if [ "$?" -ne 0 ]; then
  echo "Failed while verifying the composer network with the admin card.."
  exit 1
fi

echo "deploy success !!"