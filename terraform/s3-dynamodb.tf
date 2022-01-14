resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-up-and-running-state-for-nikita-mironov"
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks-for-nikita-mironov"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state-for-nikita-mironov"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-up-and-running-locks-for-nikita-mironov"
    encrypt        = true
  }
}