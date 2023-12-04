#!/usr/bin/env bash
printf "\nCreating SNS with name $TOPIC_NAME\n"
TOPIC_ARN=$(awslocal sns create-topic --name "$TOPIC_NAME" --output text)

printf "\nCreated SNS topic $TOPIC_NAME with ARN $TOPIC_ARN\n"

printf "\nCreating SQS queue $QUEUE_NAME\n"
QUEUE_URL=$(awslocal sqs create-queue --queue-name "$QUEUE_NAME" --query 'QueueUrl' --output text)
QUEUE_ARN=$(awslocal sqs get-queue-attributes --queue-url $QUEUE_URL --attribute-names 'QueueArn' --query 'Attributes.QueueArn' --output text)

printf "\nCreated SQS queue $QUEUE_URL with ARN $QUEUE_ARN"

printf "\nSubscribing SQS queue to SNS topic"
SUBSCRIPTION_ARN=$(awslocal sns subscribe --topic-arn "$TOPIC_ARN" --protocol sqs --notification-endpoint "$QUEUE_ARN" --query 'SubscriptionArn' --output text)
printf "\nSubscribed SQS queue $QUEUE_URL to SNS topic $TOPIC_ARN with subscription ARN $SUBSCRIPTION_ARN"