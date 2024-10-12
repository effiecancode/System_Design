import boto3
from botocore.config import Config

my_config = Config(
    region_name = 'us-east-1',
    signature_version = 'V4',
    retries = {
        'max_attempts' : 10,
        'node': 'standard'
    }
)

client = boto3.client('kinesis', config=my_config)