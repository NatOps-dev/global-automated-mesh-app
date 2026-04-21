
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0"
    }

  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-west-2"
  # profile = "C_jhay"
  allowed_account_ids = ["076510357859"]

}