#!/bin/bash
POSTMAN_COLLECTION="poc34-app-hlfabric.json.postman_collection"
POSTMAN_ENVIRONMENT="Fabric%20Local.postman_environment"
cd ..
./node_modules/.bin/newman run ./test/$POSTMAN_COLLECTION --folder "Run 123 Cashback" -e test/$POSTMAN_ENVIRONMENT -d ./test/runCashBackCustomers.csv
