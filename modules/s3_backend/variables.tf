variable "bucket_name" {
  description = "The name of the S3 bucket for storing Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The DynamoDB table name for state locking"
  type        = string
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
}
