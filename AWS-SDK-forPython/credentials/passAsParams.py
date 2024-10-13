import boto3
import os

# Read environment
ACCESS_KEY = os.environ.get('AWS_ACCESS_KEY_ID')
SECRET_KEY = os.environ.get('AWS_SECRET_ACCESS_KEY')
SESSION_TOKEN = os.environ.get('AWS_SESSION_TOKEN')

# Error Handling
if not all([ACCESS_KEY, SECRET_KEY, SESSION_TOKEN]):
    raise ValueError('Missing required AWS credentials in environment variables')

client = boto3.Client(
    's3',
    aws_access_key_id=ACCESS_KEY,
    aws_secret_access_key=SECRET_KEY,
    aws_session_token=SESSION_TOKEN
)

# Consider:
# Secrurity, Portability and Error Handling

