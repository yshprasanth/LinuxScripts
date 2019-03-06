#!/bin/bash
POSTMAN_COLLECTION="poc34-app-hlfabric.json.postman_collection"
POSTMAN_ENVIRONMENT="Fabric%20Local.postman_environment"
cd ..
./node_modules/.bin/newman run ./test/$POSTMAN_COLLECTION --folder "Preload Product" -e test/$POSTMAN_ENVIRONMENT
./node_modules/.bin/newman run ./test/$POSTMAN_COLLECTION --folder "Preload Accounts" -e test/$POSTMAN_ENVIRONMENT -d ./test/preload123Customers.csv
./node_modules/.bin/newman run ./test/$POSTMAN_COLLECTION --folder "Preload Direct Debit Payees" -e test/$POSTMAN_ENVIRONMENT -d ./test/preloadDirectDebitPayees.csv
./node_modules/.bin/newman run ./test/$POSTMAN_COLLECTION --folder "Preload Account Direct Debits" -e test/$POSTMAN_ENVIRONMENT -d ./test/preloadAccountDirectDebits.csv
./node_modules/.bin/newman run ./test/$POSTMAN_COLLECTION --folder "Preload Income Payments" -e test/$POSTMAN_ENVIRONMENT -d ./test/preloadIncomePayments.csv
./node_modules/.bin/newman run ./test/$POSTMAN_COLLECTION --folder "Preload Direct Debit Payments" -e test/$POSTMAN_ENVIRONMENT -d ./test/preloadDirectDebitPayments.csv

