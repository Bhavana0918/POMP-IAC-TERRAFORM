data "aws_caller_identity" "current" {}
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}


data "aws_iam_policy_document" "dynamodb_access" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:UpdateItem",
      "dynamodb:DeleteItem",
      "dynamodb:Scan",
      "dynamodb:Query",
    ]
    resources = [
      "arn:aws:dynamodb:${var.aws_region}:${data.aws_caller_identity.current.account_id}:table/${var.table_name}",
    ]
  }
}


resource "aws_iam_role" "iam_for_lambda" {
  name               = var.lambda_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


resource "aws_iam_role_policy" "lambda_dynamodb_policy" {
  name   = "${var.lambda_iam_role_name}_dynamodb_policy"
  role   = aws_iam_role.iam_for_lambda.name
  policy = data.aws_iam_policy_document.dynamodb_access.json
}


data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.source_file
  output_path = "lambda_function_payload.zip"
}


resource "aws_lambda_function" "test_lambda" {
  filename         = "lambda_function_payload.zip"
  function_name    = var.lambda_function_name
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = var.lambda_handler
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime          = var.lambda_runtime

  environment {
    variables = {
      API_GATEWAY_URL = var.API_GATEWAY_URL
    }
  }

}
