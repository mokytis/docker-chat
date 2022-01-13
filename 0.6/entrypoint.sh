#!/bin/bash

/usr/bin/ncat \
  --keep-open   \
  --listen      \
  -4            \
  --chat \
  --output /var/log/chat/chat.log \
  --append \
  --ssl \
  --ssl-cert /ssl-in-image/cert.pem \
  --ssl-key /ssl-in-image/key.pem \
  $@
