#!/bin/bash

#Create bna file
mv poc34-bix-app@0.0.1.bna poc34-bix-app@0.0.1.bna.old
composer archive create -t dir -n ..

if [ "$?" -ne 0 ]; then
  echo "Failed while building the app.."
  mv poc34-bix-app@0.0.1.bna.old poc34-bix-app@0.0.1.bna
  exit 1
fi

rm poc34-bix-app@0.0.1.bna.old
echo "build success !!"