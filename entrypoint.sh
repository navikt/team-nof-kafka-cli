#!/bin/bash

if [[ -z "$KAFKA_BROKERS" ]]; then
    echo "missing required variable KAFKA_BROKERS"
else
  KAFKA_BROKERS=$(cat /var/run/secrets/KAFKA_BROKERS)
  export KAFKA_BROKERS
fi

if [[ -z "$KAFKA_KEYSTORE_PATH" ]]; then
    echo "missing required variable KAFKA_KEYSTORE_PATH"
fi

if [[ -z "$KAFKA_TRUSTSTORE_PATH" ]]; then
    echo "missing required variable KAFKA_TRUSTSTORE_PATH"
fi

if [[ -z "$KAFKA_CREDSTORE_PASSWORD" ]]; then
    echo "missing required variable KAFKA_CREDSTORE_PASSWORD"
fi

echo "
security.protocol=SSL
ssl.keystore.type=PKCS12
ssl.keystore.location=/var/run/secrets/client.keystore.p12
ssl.keystore.password=$KAFKA_CREDSTORE_PASSWORD
ssl.truststore.location=/var/run/secrets/client.truststore.jks
ssl.truststore.password=$KAFKA_CREDSTORE_PASSWORD
" >> config/aiven.conf

pwd

cat config/aiven.conf

exec "$@"
