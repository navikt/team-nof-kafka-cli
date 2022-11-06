### Config

### Reset streams application
Reset topologi (kafka strømmen), application-id er laget av nais og finnes som env-var i poden
```shell
kubectl exec -i deploy/kafka-cli -- kafka-streams-application-reset 
 --application-id aap.vedtak_stream_ \
 --input-topics aap.medlem.v1
```

### Show consumers in a group
```shell
kubectl exec -i deploy/kafka-cli -- kafka-consumer-groups
 --group aap.vedtak_stream_ \
 --describe
```

### List consumer groups
```shell
kubectl exec -i deploy/kafka-cli -- kafka-consumer-groups --list
```

### Interactive shell commands
Use scripts from /scripts to include brokers and aiven config, e.g:

```shell
kubectl exec -i deploy/kafka-cli -- kafka-consumer-groups --list
```

```shell
kubectl exec -i deploy/kafka-cli -- kafka-topics --describe --topic aap.soknad-sendt.v1 
```

