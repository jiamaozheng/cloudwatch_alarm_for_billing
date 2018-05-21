# set_alarm_for_stopping_ec2
This script is used to create a billing alarm to monitor your estimated AWS charges
By default, the alarm is triggered when the cost is over $500 over six hours period.
Please feel free to adjust the threshold to meet your needs.

## Run
```
bash set_alarm_for_billing.sh <iam_user_name> <email_address>
```

## Confirm subscription
Confirm email subscription by clicking the confirmation link
in the body of the message to complete the subscription process.

## Outcome
1) Generate a CloudWatch alarm
2) Generate a SNS topic
3) Subscribed the SNS topic with your email
