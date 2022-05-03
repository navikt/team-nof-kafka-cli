FROM eclipse-temurin:18-alpine

RUN apk update && apk upgrade && apk add bash curl jq wget

ENV KAFKA_URL=https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz
ENV KAFKA_DOWNLOAD=/download/kafka.tgz
ENV KAFKA_WORKDIR=/cli/kafka
ENV PATH=$PATH:/${KAFKA_WORKDIR}/bin

RUN wget ${KAFKA_URL} -O ${KAFKA_DOWNLOAD}

RUN tar -xvzpf ${KAFKA_DOWNLOAD} --strip-components=1 -C ${KAFKA_WORKDIR} && rm ${KAFKA_DOWNLOAD}

WORKDIR ${KAFKA_WORKDIR}

CMD ["tail", "-f", "/dev/null"]
