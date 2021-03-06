#!/bin/bash
SERVICE_NAME=ConfigService
PATH_TO_JAR=/ConfigServer-0.0.1-SNAPSHOT.jar
PROCESSCNT=$(ps x | grep -v grep | grep -c "ConfigServer-0.0.1-SNAPSHOT.jar")
#PID=$(ps aux | grep "ConfigServer-0.0.1-SNAPSHOT.jar" | grep -v grep | awk '{print $2}')
if [ $PROCESSCNT == 0 ]; then
    echo "Starting $SERVICE_NAME ..."
    nohup java -jar $PATH_TO_JAR 2>> /dev/null >> /dev/null &
    echo "$SERVICE_NAME started ..."
#else
#    echo "$SERVICE_NAME is already running ..."
fi
