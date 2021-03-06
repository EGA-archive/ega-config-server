#!/bin/bash
SERVICE_NAME=ConfigService
PATH_TO_JAR=/config-server-0.0.1-SNAPSHOT.jar
PROCESSCNT=$(ps x | grep -v grep | grep -c "config-server-0.0.1-SNAPSHOT.jar")
PID=$(ps aux | grep "config-server-0.0.1-SNAPSHOT.jar" | grep -v grep | awk '{print $2}')
case $1 in
    start)
	if [ $PROCESSCNT == 0 ]; then
	    echo "Starting $SERVICE_NAME ..."
	    nohup java -jar $PATH_TO_JAR 2>> /dev/null >> /dev/null &
	    echo "$SERVICE_NAME started ..."
	else
	    echo "$SERVICE_NAME is already running ..."
	fi
    ;;
    stop)
        if [ $PROCESSCNT != 0 ]; then
            echo "$SERVICE_NAME stopping ..."
            kill $PID;
                        sleep 2s
            echo "$SERVICE_NAME stopped ..."
        else
            echo "$SERVICE_NAME is not running ..."
        fi
    ;;
esac
