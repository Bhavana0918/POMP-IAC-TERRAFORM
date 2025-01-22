output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3_backend.bucket_name
}

output "dynamodb_table_name" {
  description = "The DynamoDB table used for state locking"
  value       = module.s3_backend.dynamodb_table_name
}

output "table_name" {
  value = module.dynamodb_table.table_name

}


output "amplify_app_url" {
  value = module.aws_amplify_app.amplify_app_url
}


output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "ssm_api_gateway_value" {
  sensitive = true
  value = module.ssm_api_gateway.ssm_api_gateway_url
}