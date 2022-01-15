resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.project_name}-state"
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "${var.project_name}-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

# terraform {
#   backend "s3" {
#     bucket         = "terraform-up-and-running-for-nikita-mironov-state"
#     key            = "global/s3/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-up-and-running-for-nikita-mironov-locks"
#     encrypt        = true
#   }
# }