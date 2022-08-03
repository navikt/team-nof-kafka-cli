FROM eclipse-temurin:18-alpine

RUN apk update && apk upgrade && apk add bash curl jq vim

ENV KAFKA_URL=https://dlcdn.apache.org/kafka/3.2.1/kafka_2.13-3.2.1.tgz
ENV KAFKA_DOWNLOAD=/download/kafka.tgz
ENV KAFKA_WORKDIR=/cli/kafka
ENV PATH=${KAFKA_WORKDIR}/bin:${PATH}

RUN curl ${KAFKA_URL} --create-dirs -o ${KAFKA_DOWNLOAD}
RUN mkdir -p ${KAFKA_WORKDIR}
RUN tar -xvzpf ${KAFKA_DOWNLOAD} --strip-components=1 -C ${KAFKA_WORKDIR} && rm ${KAFKA_DOWNLOAD}

WORKDIR ${KAFKA_WORKDIR}

COPY entrypoint.sh /cli/

RUN touch /cli/kafka/config/aiven.conf
RUN chmod 777 /cli/kafka/config/aiven.conf

CMD ["/cli/entrypoint.sh"]
