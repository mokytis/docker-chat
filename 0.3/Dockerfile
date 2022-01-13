FROM centos:7
RUN yum --assumeyes install nmap-ncat

EXPOSE 6666
RUN useradd -r -u 876 chatter
USER chatter

ENTRYPOINT ["/usr/bin/ncat", "--keep-open", "--listen", "-4", "--chat",]
CMD ["6666"]
