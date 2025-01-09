output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = module.s3_backend.bucket_name
}

output "dynamodb_table_name" {
  description = "The DynamoDB table used for state locking"
  value       = module.s3_backend.dynamodb_table_name
}

output "table_name" {
  value=module.dynamodb_table.table_name
  
}





# output "app_name" {
#   value =module.amplify.app_name
# }

# output "hosting_bucket" {
#   value = module.amplify.hosting_bucket
# }



# output "s3_bucket_name" {
#   value = module.amplify.s3_bucket_name
# }

# output "amplify_app_id" {
#   value = module.amplify.amplify_app_id
# }

# output "amplify_branch_name" {
#   value = module.amplify.amplify_branch_name
# }

# output "s3_index_url" {
#   value = module.amplify.s3_index_url
# }

output "amplify_app_url" {
  value = module.aws_amplify_app.amplify_app_url
}


output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}