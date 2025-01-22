resource "aws_ssm_parameter" "api_gateway_url" {
  name  = "/app/api_gateway_url"
  type  = "String"
  value = var.api_gateway_url
}
