### Config

### Reset streams application
```shell
kafka-streams-application-reset.sh --bootstrap-servers $KAFKA_BROKERS \
 --config-file $AIVEN_CONF \
 --application-id aap.vedtak_stream_ \
 --input-topics aap.medlem.v1
```

### Show consumers in a group
```shell
kafka-consumer-groups.sh --bootstrap-server $KAFKA_BROKERS \
 --command-config $AIVEN_CONF \
 --group aap.vedtak_stream_ \
 --describe
```

### List consumer groups
```shell
kafka-consumer-groups.sh --bootstrap-server $KAFKA_BROKERS --command-config  $AIVEN_CONF --list
```

### Interactive shell commands
```shell
kubectl exec -i kafka-cli-b669dbc8f-t6gsn -- kafka-consumer-groups.sh /
  --bootstrap-server "nav-prod-kafka-nav-prod.aivencloud.com:26484" /
  --command-config "/cli/kafka/config/aiven.conf" /
  --list
```
