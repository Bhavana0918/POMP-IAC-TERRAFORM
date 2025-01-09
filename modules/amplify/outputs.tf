# output "amplify_app_id" {
#   description = "The ID of the Amplify app."
#   value       = aws_amplify_app.app.id
# }

#  output "amplify_app_url" {
#   description = "The URL of the Amplify app."
#    value       = aws_amplify_app.app.default_domain
#  }

# output "app_name" {
#   value = aws_amplify_app.app.name
# }

# output "hosting_bucket" {
#   value = aws_s3_bucket.static_site.bucket
# }


output "amplify_app_url" {
  description = "The URL of the Amplify app"
  value       = aws_amplify_app.web_app.default_domain
}

