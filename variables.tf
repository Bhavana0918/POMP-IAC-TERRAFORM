variable "aws_region" {
  description = "The AWS region"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket for backend state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "The DynamoDB table name for state locking"
  type        = string
}




variable "app_name" {
  description = "The name of the Amplify app."
  type        = string
}




variable "oauth_token" {
  description = "OAuth token for accessing GitHub repositories"
  type        = string
  sensitive   = true
}

variable "github_repository" {
  type = string 
}



variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "source_file" {
  description = "The directory containing the Lambda function code"
  type        = string
}

# variable "environment_variables" {
#   description = "Environment variables for the Lambda function"
#   type        = map(string)
#   default     = {}
# }


variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  type        = string
}

variable "api_stage" {
  description = "Stage name for API Gateway"
  default     = "prod"
}





# variable "hosting_bucket" {
#   type        = string
# }
# variable "access_token" {
#   type = string
  
# }


# variable "hosting_bucket" {
#   type        = string
# }
# variable "index_file_path" {
#   type        = string
# }


variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "The primary key (hash key) for the table"
  type        = string
}

variable "hash_key_type" {
  description = "The data type for the hash key (S, N, or B)"
  type        = string
  default     = "S"
}

variable "sort_key" {
  description = "The optional sort key for the table"
  type        = string
  default     = null
}

variable "sort_key_type" {
  description = "The data type for the sort key (S, N, or B)"
  type        = string
  default     = "S"
}

variable "billing_mode" {
  description = "The billing mode for the table (PAY_PER_REQUEST or PROVISIONED)"
  type        = string
  default     = "PAY_PER_REQUEST"
}

variable "read_capacity" {
  description = "The read capacity for the table (only used if billing_mode is PROVISIONED)"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "The write capacity for the table (only used if billing_mode is PROVISIONED)"
  type        = number
  default     = 5
}

variable "tags" {
  description = "A map of tags to assign to the table"
  type        = map(string)
  default     = {}
}

variable "lambda_handler" {
  description = "The Lambda handler"
  type        = string
  default     = "power-of-math-funtion.lambda_handler"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function"
  type        = string
  default     = "python3.8"
}

variable "lambda_iam_role_name" {
  description = "The name of the IAM role for the Lambda function"
  type        = string
  default     = "iam_for_lambda"
}