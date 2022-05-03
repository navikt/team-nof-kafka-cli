FROM jorgenringen/kafkacmd

RUN apt-get update -y

CMD ["tail", "-f", "/dev/null"]
