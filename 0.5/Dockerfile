# 2021-02-02: pdn:  chat service with log to volume
#  docker build --tag local/chatssl_i  --tag local/chatssl_i:0.5 .
#  docker run --name chatssl_c -d -p 127.0.0.1:7777:6666 local/chatssl_i:0.5 6666
#  docker run --name chatssl_c -d -v CHAT_LOG_VOL:/var/log/chat/ -p 127.0.0.1:7777:6666 local/chatssl_i:0.5 6666

FROM centos:7

RUN yum --assumeyes install \
  nmap-ncat

COPY ./ssl /ssl-in-image

EXPOSE 6666

RUN useradd -r -u 876 chatter && \
    mkdir -p /var/log/chat/ && \
    chown chatter:chatter /var/log/chat/

VOLUME /var/log/chat/

USER chatter
ENTRYPOINT [  "/usr/bin/ncat", \
              "--keep-open",   \
              "--listen",      \
              "-4",            \
             "--chat", \
             "--output", "/var/log/chat/chat.log", \
             "--append", \
             "--ssl", \
             "--ssl-cert", "/ssl-in-image/cert.pem", \
             "--ssl-key", "/ssl-in-image/key.pem" \
           ]
CMD ["6666"]
