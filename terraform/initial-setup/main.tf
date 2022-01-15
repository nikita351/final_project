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
}