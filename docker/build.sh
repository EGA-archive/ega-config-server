#!/bin/bash
git clone https://github.com/elixir-europe/ega-data-api-v3-config.git
mvn -f /ega-data-api-v3-config/pom.xml install
mv /ega-data-api-v3-config/target/ConfigServer-0.0.1-SNAPSHOT.jar /EGA_build
mv /ega-data-api-v3-config/docker/configd.sh /EGA_build
mv /ega-data-api-v3-config/docker/Dockerfile_Deploy /EGA_build
mv /ega-data-api-v3-config/docker/monitrc /EGA_build
