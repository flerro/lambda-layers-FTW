#!/bin/sh

cd $(dirname $(dirname $0))

# Use an AWS profile different than 'default'
export AWS_DEFAULT_PROFILE=personal

BUCKET=lambda-layer-ftw-deploy
REGION=eu-west-3

# Create deploy bucket
# aws s3 mb s3://$BUCKET --region $REGION

# echo "Uploading layers..."
# aws s3 cp build/layer.zip s3://lambda-layer-ftw-deploy/layer-wordcloud.zip

echo "Creating deploy package..."
sam package --template-file template.yml --output-template-file deploy.yml --s3-bucket $BUCKET --region $REGION

echo "Creating stack..."
sam deploy --capabilities CAPABILITY_IAM --template-file deploy.yml --stack-name layer-ftw-python --s3-bucket $BUCKET --region $REGION
