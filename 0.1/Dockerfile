FROM centos:7

RUN yum --assumeyes install nmap-ncat

EXPOSE 6666
ENTRYPOINT ["/usr/bin/ncat", "--keep-open", "--listen", "-4", "--chat"]
CMD ["6666"]
