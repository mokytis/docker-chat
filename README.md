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

