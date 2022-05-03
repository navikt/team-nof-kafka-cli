### Reset
```shell
kafka-streams-application-reset --bootstrap-servers $KAFKA_BROKERS \
 --config-file config \
 --application-id aap.vedtak_stream_ \
 --input-topics aap.medlem.v1
```

### Config
```shell
echo "
#bootstrap.servers=$KAFKA_BROKERS
security.protocol=SSL

ssl.truststore.type=JKS
ssl.truststore.location=$KAFKA_TRUSTSTORE_PATH
ssl.truststore.password=$KAFKA_CREDSTORE_PASSWORD

#ssl.keystore.type=PKCS12
ssl.keystore.type=JKS
#ssl.keystore.location=$KAFKA_KEYSTORE_PATH
ssl.keystore.location=keystore.jks
ssl.keystore.password=$KAFKA_CREDSTORE_PASSWORD
ssl.key.password=$KAFKA_CREDSTORE_PASSWORD
" >> config && cat config
```

### Convert PCKS12 to JKS
```shell
keytool -importkeystore \
 -srckeystore $KAFKA_KEYSTORE_PATH \
 -srcstoretype PKCS12 \
 -srcstorepass $KAFKA_CREDSTORE_PASSWORD \
 -destkeystore keystore.jks \
 -deststoretype jks \
 -deststorepass $KAFKA_CREDSTORE_PASSWORD
```

```shell
keytool -importkeystore \
 -srckeystore $KAFKA_TRUSTSTORE_PATH \
 -srcstoretype JKS \
 -srcstorepass $KAFKA_CREDSTORE_PASSWORD \
 -destkeystore truststore.jks \
 -deststoretype jks \
 -deststorepass $KAFKA_CREDSTORE_PASSWORD
```

### Consumer groups
```shell
kafka-consumer-groups --bootstrap-server $KAFKA_BROKERS \
 --command-config config \
 --group aap.vedtak_stream_ \
 --describe
```

```shell
kafka-consumer-groups --bootstrap-server $KAFKA_BROKERS --command-config config \
  --list
```