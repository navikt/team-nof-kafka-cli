### Config
Create a security config `aiven.conf` in directory `/tmp` as this is the only writeable directory.
Goto `/tmp` before executing any scripts.
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

### Reset streams application
```shell
kafka-streams-application-reset.sh --bootstrap-servers $KAFKA_BROKERS \
 --config-file aiven.conf \
 --application-id aap.vedtak_stream_ \
 --input-topics aap.medlem.v1
```

### Show consumers in a group
```shell
kafka-consumer-groups.sh --bootstrap-server $KAFKA_BROKERS \
 --command-config aiven.conf \
 --group aap.vedtak_stream_ \
 --describe
```

### List consumer groups
```shell
kafka-consumer-groups.sh --bootstrap-server $KAFKA_BROKERS --command-config aiven.conf \
  --list
```