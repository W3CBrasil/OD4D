#!/usr/bin/env bash

function start_process {
  PROCESS=$1
  PROCESS_PATH=$2
  LOG_FILE=$3
  COMMAND_LINE_ARGS=$4

  if [ "$(pgrep $PROCESS)" != "" ]; then
    "$PROCESS is already runnning."
    exit 1
  fi

  if [ ! -f $LOG_FILE ]; then
    touch $LOG_FILE
  fi

  echo "Staring $PROCESS..."

  pushd $PROCESS_PATH &> /dev/null
  ./$PROCESS $COMMAND_LINE_ARGS &>> $LOG_FILE &
  popd &> /dev/null

  COUNTER=0
  while [ "$(pgrep -f $PROCESS)" == "" ] && [ $COUNTER -lt 3 ]; do
    echo "sleep"
    sleep 1s
    let COUNTER=COUNTER+1
  done

  if [ "$(pgrep -f $PROCESS)" == "" ]; then
    echo "Unable to start $PROCESS"
    echo "Check the log file: $LOG_FILE"
    exit 1
  fi
  echo "Started $PROCESS"
}

APP_INSTALL_FOLDER="$HOME/od4d"
LOG_FOLDER="$APP_INSTALL_FOLDER/logs"
FUSEKI_FOLDER="$APP_INSTALL_FOLDER/fuseki"

if [ ! -e $LOG_FOLDER ]; then
  mkdir -p $LOG_FOLDER
fi

start_process fuseki-server $FUSEKI_FOLDER "$LOG_FOLDER/fuseki.log" "--localhost --config=fuseki-config.ttl"
