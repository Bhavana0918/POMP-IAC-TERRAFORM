  resource "aws_s3_bucket" "state_bucket" {
    bucket = var.bucket_name
  }

  resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
    bucket = aws_s3_bucket.state_bucket.bucket
    versioning_configuration {
      status = "Disabled"
    }
  }

  resource "aws_dynamodb_table" "state_lock" {
    name           = var.dynamodb_table_name
    hash_key       = "LockID"
    read_capacity  = 5
    write_capacity = 5
    billing_mode   = "PROVISIONED"
    attribute {
      name = "LockID"
      type = "S"
    }

    tags = {
      Name = "TerraformStateLockTable"
    }
  }



