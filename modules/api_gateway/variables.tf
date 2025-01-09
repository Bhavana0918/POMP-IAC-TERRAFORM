variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "api_stage" {
  description = "Stage name for API Gateway"
  default     = "prod"
}
