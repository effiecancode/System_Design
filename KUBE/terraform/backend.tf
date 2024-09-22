# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "helloworld-terraform-remote-state"
    key            = "helloworld-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "helloworld-state-lock"
  }
}