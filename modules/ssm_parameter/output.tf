output "ssm_api_gateway_url" {
  value = aws_ssm_parameter.api_gateway_url.value
}