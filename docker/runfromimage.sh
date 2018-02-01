#!/bin/bash
sudo docker run -d -p 8888:8888 -v $1:/config alexandersenf/ega_config
