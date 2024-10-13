import boto3
from botocore.config import Config

proxy_definitions = {
    'http': 'http://proxy.amazon.com:6502',
    'https': 'https://proxy.amazon.org:2010'
}

my_config = Config(
    region_name = 'us-east-1',
    signature_version = 'V4',
    proxies = proxy_definitions
)

client = boto3.client('kinesis', config=my_config)