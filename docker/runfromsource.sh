#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo docker run --rm --name build -v $DIR:/EGA_build -it alexandersenf/ega_build sh -c 'exec /EGA_build/build.sh'
sudo docker build -t ega_config -f Dockerfile_Deploy .
sudo rm ConfigServer-0.0.1-SNAPSHOT.jar
sudo rm Dockerfile_Deploy
sudo rm configd.sh
sudo docker run -d -p 8888:8888 -v $1:/config ega_config
