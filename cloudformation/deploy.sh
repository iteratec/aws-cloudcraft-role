#!/usr/bin/env bash

set -ex

ACTION=$1

SERVICE="cloudcraft-role"

if [ "$ACTION" == "create" ] || [ "$ACTION" == "update" ] 
then
    echo "Start $ACTION-ing CloudFormation stack"
    aws cloudformation $ACTION-stack \
    --stack-name $SERVICE \
    --template-body file://$SERVICE.yaml \
    --capabilities CAPABILITY_NAMED_IAM
else
    echo "Action need to be defined - where action can be 'create' or 'update'"
fi
