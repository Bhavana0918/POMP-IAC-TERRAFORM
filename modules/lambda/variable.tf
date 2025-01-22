variable "aws_region" {
  description = "The AWS region for the Lambda function and DynamoDB"
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
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

variable "source_file" {
  description = "Path to the source file for the Lambda function"
  type        = string
}

variable "table_name" {
  description = "The name of the DynamoDB table the Lambda function can access"
  type        = string
}

variable "lambda_iam_role_name" {
  description = "The name of the IAM role for the Lambda function"
  type        = string
  default     = "iam_for_lambda"
}

# variable "API_GATEWAY_URL" {
#   type = string
  
# }

# variable "environment_variables" {
#   description = "Environment variables for the Lambda function"
#   type        = map(string)
#   default     = null
# }

