### Reset
```shell
kafka-streams-application-reset --bootstrap-servers $KAFKA_BROKERS \
 --config-file config \
 --application-id aap.vedtak_stream_ \
 --input-topics aap.medlem.v1
```

### Consumer groups
```shell
kafka-consumer-groups --bootstrap-server $KAFKA_BROKERS \
 --command-config config \
 --group aap.vedtak_stream_ \
 --describe
```

```shell
kafka-consumer-groups.sh --bootstrap-server $KAFKA_BROKERS --command-config aiven.conf \
  --list
```

### Config
```shell
echo "
security.protocol=SSL

ssl.keystore.type=PKCS12
ssl.keystore.location=$KAFKA_KEYSTORE_PATH
ssl.keystore.password=$KAFKA_CREDSTORE_PASSWORD

ssl.truststore.location=$KAFKA_TRUSTSTORE_PATH
ssl.truststore.password=$KAFKA_CREDSTORE_PASSWORD
" >> aiven.conf
```
