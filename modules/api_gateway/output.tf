output "api_gateway_url" {
  value = "https://${aws_api_gateway_rest_api.my_api.id}.execute-api.${var.aws_region}.amazonaws.com/${var.api_stage}/math"
}

# output "api_gateway_url" {
#   value = aws_api_gateway_deployment.api_deployment.invoke_url
# }