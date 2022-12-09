### Config

### Reset streams application
Reset topologi (kafka strømmen), application-id er laget av nais og finnes som env-var i poden.

OBS! 

- kafka-cli applikasjonen må deployes med en gyldig aiven secret for applikasjonen som eier de interne streams topicene.

- Streams applikasjonen må pauses når man kjører denne kommandoen. I kubernetes kan dette gjøres ved å sette replicas på deploymenten til 0 midlertidig.

Eksempel:
```shell
kubectl scale deployment fullmakt-state-converter --replicas=0
```

```shell
kubectl exec -i deploy/kafka-cli -- kafka-streams-application-reset 
 --application-id team-nof.fullmakt-state-converter_ \
 --input-topics team-nof.fullmakt-eventsource
```

### Show consumers in a group
```shell
kubectl exec -i deploy/kafka-cli -- kafka-consumer-groups
 --group team-nof.fullmakt-state-converter_ \
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
kubectl exec -i deploy/kafka-cli -- kafka-topics --describe --topic team-nof.fullmakt-eventsource
```

