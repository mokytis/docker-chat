# 2021-02-02: pdn:  chat service with log to volume
#  docker build --tag local/chatssl_i  --tag local/chatssl_i:0.6 .
#  docker run --name chatssl_c -d -p 127.0.0.1:7777:6666 local/chatssl_i:0.6 6666
#  docker run --name chatssl_c -d -v CHAT_LOG_VOL:/var/log/chat/ -p 127.0.0.1:7777:6666 local/chatssl_i:0.6 6666

# the image from which we will start
FROM centos:7

# commands to run as root to modify original
RUN yum --assumeyes install \
  nmap-ncat

# generate ssl self-signed cert and key with
# openssl req -x509 -nodes -newkey rsa:1024 -keyout ssl/key.pem -out ssl/cert.pem -days 1825 -subj /CN=chat.cyber.test
# openssl x509 -noout -text -in ssl/cert.pem

# make key / cert available in the container
COPY ./ssl /ssl-in-image
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# tcp port in the container
EXPOSE 6666

# create a system user id that will run the service
RUN useradd -r -u 876 chatter && \
    mkdir -p /var/log/chat/ && \
    chown chatter:chatter /var/log/chat/

# mount a host directory (from somewhere!) to /var/log/chat in the container
VOLUME /var/log/chat/

# from now on, do everything as this new user
USER chatter

# (default) command to run when container launches
ENTRYPOINT [  "/entrypoint.sh" ]

# (default) parameter to concatenate onto the command in ENTRYPOINT
CMD [ "6666"  ]
