#!/bin/bash

export POSTGRES_USERNAME_BASE64=`echo -n "$POSTGRES_USERNAME" | base64`
export POSTGRES_PASSWORD_BASE64=`echo -n "$POSTGRES_PASSWORD" | base64`
export POSTGRES_HOST_BASE64=`echo -n "$POSTGRES_HOST" | base64`
export POSTGRES_DB_BASE64=`echo -n "$POSTGRES_DB" | base64`
export AWS_BUCKET_BASE64=`echo -n "$AWS_BUCKET" | base64`
export AWS_REGION_BASE64=`echo -n "$AWS_REGION" | base64`
export AWS_PROFILE_BASE64=`echo -n "$AWS_PROFILE" | base64`
export JWT_SECRET_BASE64=`echo -n "$JWT_SECRET" | base64`
export URL_BASE64=`echo -n "$URL" | base64`
export AWS_CREDENTIALS_FILE_BASE64=`cat $HOME/.aws/credentials | base64 -w 0`

cat common-env-variables.yaml | envsubst | kubectl apply -f -
