
output "amplify_app_url" {
  description = "The URL of the Amplify app"
  value       = aws_amplify_app.web_app.default_domain
}

