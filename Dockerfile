FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y software-properties-common netcat-openbsd && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y fortune-mod cowsay && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY wisecow.sh 

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]
