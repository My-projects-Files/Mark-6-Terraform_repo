import json
import boto3
import uuid

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('json-data-format')

    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']

        # Get the JSON content from S3
        response = s3.get_object(Bucket=bucket, Key=key)
        content = response['Body'].read().decode('utf-8')
        data = json.loads(content)

        # Add unique ID (partition key for DynamoDB)
        data['id'] = str(uuid.uuid4())

        # Put item into DynamoDB
        table.put_item(Item=data)

    return {
        'statusCode': 200,
        'body': 'Data inserted into DynamoDB'
    }

