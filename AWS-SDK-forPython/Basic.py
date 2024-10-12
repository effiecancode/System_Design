import boto3

# create an s3 client
s3_client = boto3.client('s3')

# list buckets
response = s3_client.list_buckets()

# print bucket names
for bucket in response["Buckets"]:
    print(f"Bucket Name: {bucket['Name']}")