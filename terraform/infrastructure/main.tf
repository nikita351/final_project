provider "aws" {
   region = var.region  
}

terraform {
  required_version = ">= 0.15, < 1.02"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.15"
    }
  }
  backend "s3" {
    bucket         = "terraform-up-and-running-for-nikita-mironov-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-up-and-running-for-nikita-mironov-locks"
    encrypt        = true
  }
}