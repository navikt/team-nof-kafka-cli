# COMMAND
```shell
kafka-streams-application-reset --bootstrap-servers $KAFKA_BROKERS \
 --config-file config \
 --application-id aap.vedtak_stream_ \
 --input-topics aap.medlem.v1
```

# TSL
```shell
rm config && echo "
bootstrap.servers=$KAFKA_BROKERS
ssl.protocol=TLSv1.2
ssl.truststore.location=$KAFKA_TRUSTSTORE_PATH
ssl.truststore.password=$KAFKA_CREDSTORE_PASSWORD
" >> config && cat config
```

# MUTUAL AUTH
```shell
rm config && echo "
bootstrap.servers=$KAFKA_BROKERS
security.protocol=SSL
#ssl.keystore.type=PKCS12
ssl.keystore.location=$KAFKA_KEYSTORE_PATH
ssl.keystore.password=$KAFKA_CREDSTORE_PASSWORD
" >> config && cat config
```


kafka-consumer-groups --bootstrap-server $KAFKA_BROKERS \
 --command-config config \
 --group aap.vedtak_stream_ --describe