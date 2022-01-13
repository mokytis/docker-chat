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

