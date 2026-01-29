#!/usr/bin/env bash
set -e

ROLE_NAME="snowflake-s3-dvd-rental-role"
PRINCIPAL_ARN="arn:aws:iam::056048976674:user/kl2f1000-s"
EXTERNAL_ID="JV78519_SFCRole=2_hfbj2Zl8Jt/w4FX4Wq1Hg8voFY0="

aws iam update-assume-role-policy \
  --role-name "$ROLE_NAME" \
  --policy-document "$(cat <<EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Effect": "Allow",
    "Principal": {
      "AWS": "$PRINCIPAL_ARN"
    },
    "Action": "sts:AssumeRole",
    "Condition": {
      "StringEquals": {
        "sts:ExternalId": "$EXTERNAL_ID"
      }
    }
  }]
}
EOF
)"
echo "Updated trusted relationship for role: $ROLE_NAME"