aws_region          = "us-east-1"
bucket_name         = "powerofmath-project-state"
dynamodb_table_name = "powerofmath-project-terraform-lock-table"



app_name = "power-of-math-index"

github_repository = "https://github.com/Bhavana0918/Power-Of-Math"

lambda_function_name = "PowerOfMathFuntion"
source_file          = "modules/lambda/power-of-math-funtion.py"
lambda_handler       = "power-of-math-funtion.lambda_handler"
lambda_runtime       = "python3.8"
lambda_iam_role_name = "math_function_role"

api_name            = "PowerOfMathAPI"
lambda_function_arn = "arn:aws:lambda:us-east-1:145023110857:function:PowerOfMathFuntion"
api_stage           = "dev"
API_GATEWAY_URL     = "https://e7boz0ngi7.execute-api.us-east-1.amazonaws.com/dev"




table_name    = "PowerOfMathTable"
hash_key      = "ID"
hash_key_type = "S"
billing_mode  = "PAY_PER_REQUEST"
