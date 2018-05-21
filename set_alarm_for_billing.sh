#!/bin/bash


# usages: bash set_alarm_for_billing.sh <iam_user_name> <email_address>


# Step one: Create a SNS-Topic

sns_topic=$(aws sns create-topic --name $1 --output text)

# Step two: Subscription Confirmation

aws sns subscribe \
        --topic-arn $sns_topic \
        --protocol email \
        --notification-endpoint $2

# Step three: Setup CloudWatch for Billing Alerts

aws cloudwatch put-metric-alarm \
        --region us-east-1 \
        --alarm-name $1-BillingAlarm \
        --alarm-description "Billing Alarm for Monthly Estimated Charges" \
        --metric-name EstimatedCharges \
        --namespace AWS/Billing \
        --statistic Maximum \
        --comparison-operator GreaterThanOrEqualToThreshold \
        --evaluation-periods 1 \
        --dimensions Name=Currency,Value=USD \
        --period 21600 \
        --threshold 500 \
        --actions-enabled \
        --alarm-actions $sns_topic
