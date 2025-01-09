import json
import math
import boto3
from time import gmtime, strftime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('PowerOfMathTable')

now = strftime("%a, %d %b %Y %H:%M:%S +0000", gmtime())

def lambda_handler(event, context):
    try:
        body = json.loads(event['body']) if 'body' in event else event

        base = int(body['base'])
        exponent = int(body['exponent'])

        math_result = math.pow(base, exponent)

        table.put_item(
            Item={
                'ID': str(math_result),
                'LatestGreetingTime': now
            }
        )

        return {
            'statusCode': 200,
            'headers': { 
                'Access-Control-Allow-Origin': '*',  
                'Access-Control-Allow-Methods': 'POST, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type'
            },
            'body': json.dumps({'result': math_result})
        }
    except KeyError as e:
        return {
            'statusCode': 400,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'POST, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type'
            },
            'body': json.dumps({'error': f"Missing key: {str(e)}"})
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'POST, OPTIONS',
                'Access-Control-Allow-Headers': 'Content-Type'
            },
            'body': json.dumps({'error': str(e)})
        }


















