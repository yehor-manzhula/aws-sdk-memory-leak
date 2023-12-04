#!/usr/bin/env bash
set -e

export QUEUE_NAME="memory-leak-queue"
export TOPIC_NAME="memory-leak-topic"

docker-compose -f docker-compose.yaml up -d

CURRENT_PROCESS_PID=$$

echo "Application will start with PID: $CURRENT_PROCESS_PID"
echo "To generate heap snapshot perform: kill -USR2 $CURRENT_PROCESS_PID"

export NODE_OPTIONS="--max-old-space-size=64"

exec node --heapsnapshot-signal=SIGUSR2 --trace-gc $1