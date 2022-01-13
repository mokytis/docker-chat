# chat

A series of docker images for demonstration services.

## Dependencies

You need to make sure you have docker installed and `nmap-ncat`. This is
designed to run on centos-7. You will either need to be `root` or in the
`docker` group.

## Usage

### Building

`build.sh` builds docker images in a given context, and tags them as
needed.  This example will build the image in `chat/0.3` and tag the image
as `local/chat:0.3`.

    $ ./build.sh 0.3

## Images

### Version 0.1

This is a simple netcat chatserver running as `root`.

To build the image and start the container:

    $ ./build.sh 0.1
    $ docker run --rm --detach \
        --publish 6601:6666 \
        --name chat_container_v0.1 \
        local/chat:0.1

To connect to the server:

    $ ncat localhost 6601

To stop and remove the container:

    $ docker stop chat_container_v0.1

### Version 0.3

This is a simple necat chatserver running as a new user `chatter`.

To build the image and start the container:

    $ ./build.sh 0.3
    $ docker run --rm --detach \
        --publish 6603:6666 \
        --name chat_container_v0.3 \
        local/chat:0.3

To connect to the server:

    $ ncat localhost 6603

To stop and remove the container:

    $ docker stop chat_container_v0.3

### Version 0.4

This is a simple necat chatserver running as a new user `chatter`. A log file
is created and volume mounted to the host system.

To build the image and start the container:

    $ ./build.sh 0.4
    $ docker run --rm --detach \
        --publish 6604:6666 \
        --name chat_container_v0.4 \
        --volume ./logs/:/var/log/chat/ \
        local/chat:0.4

To connect to the server:

    $ ncat localhost 6604

To stop and remove the container:

    $ docker stop chat_container_v0.4

### Version 0.5

This is a simple necat chatserver running as a new user `chatter`. A log file
is created and volume mounted to the host system. An SSL cert that is baked
into the image is used.

To build the image and start the container:

    $ ./build.sh 0.5
    $ docker run --rm --detach \
        --publish 6605:6666 \
        --name chat_container_v0.5 \
        --volume ./logs/:/var/log/chat/ \
        local/chat:0.5

To connect to the server:

    $ ncat localhost 6605

To stop and remove the container:

    $ docker stop chat_container_v0.5

