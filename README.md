# COMMAND
```shell
kafka-streams-application-reset --bootstrap-servers $KAFKA_BROKERS \
--application-id aap.vedtak_stream_ \
--input-topics aap.medlem.v1 \
--config-file config
```

# TSL
```shell
rm config && echo "
bootstrap.servers=$KAFKA_BROKERS
ssl.protocol=TLSv1.2
ssl.truststore.type=JKS
ssl.truststore.location=$KAFKA_TRUSTSTORE_PATH
ssl.truststore.password=$KAFKA_CREDSTORE_PASSWORD
" >> config
```

# MUTUAL AUTH
```shell
rm config && echo "
security.protocol=SSL
ssl.keystore.type=PKCS12
ssl.keystore.location=$KAFKA_KEYSTORE_PATH
ssl.keystore.password=$KAFKA_CREDSTORE_PASSWORD
" >> config
```
