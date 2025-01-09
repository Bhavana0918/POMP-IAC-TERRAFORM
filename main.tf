
provider "aws" {
  region = var.aws_region
}

module "s3_backend" {
  source = "./modules/s3_backend"
  bucket_name         = var.bucket_name
  dynamodb_table_name = var.dynamodb_table_name
  aws_region          = var.aws_region
}

module "aws_amplify_app" {
  source    = "./modules/amplify"
  app_name  =var.app_name
  github_repository=var.github_repository
  oauth_token=var.oauth_token 
}


module "lambda" {
  source               = "./modules/lambda"
  aws_region           = var.aws_region
  lambda_function_name = var.lambda_function_name
  lambda_handler       = var.lambda_handler
  lambda_runtime       = var.lambda_runtime
  source_file          = var.source_file
  table_name           = var.table_name
  lambda_iam_role_name = var.lambda_iam_role_name

  # environment_variables = {
  #   ENV   = "Dev"
  #   DEBUG = "false"
  # }

  depends_on = [module.dynamodb_table ]
}




module "api_gateway" {
  source = "./modules/api_gateway"
  
  api_name           =var.api_name
  lambda_function_arn = module.lambda.lambda_function_arn
  api_stage=var.api_stage  
  depends_on = [module.lambda]
}



module "dynamodb_table" {
  source        = "./modules/dynamodb_table"
  table_name    = var.table_name
  hash_key      = var.hash_key
  hash_key_type = var.hash_key_type  
  billing_mode  = var.billing_mode

  tags = {
    Environment = "Dev"
    Project     = "PowerOfMath"
  }
}





