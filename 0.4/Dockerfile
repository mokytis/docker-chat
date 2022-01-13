FROM centos:7

RUN yum --assumeyes install nmap-ncat

EXPOSE 6666

RUN useradd -r -u 876 chatter && \
    mkdir -p /var/log/chat && \
    chown chatter:chatter /var/log/chat/

VOLUME /var/log/chat/

USER chatter

ENTRYPOINT ["/usr/bin/ncat", \
            "--keep-open", \
            "--listen", \
            "-4", \
            "--chat", \
            "--output", \
            "/var/log/chat/chat.log", \
            "--append" \
            ]

CMD ["6666"]
