resource "aws_amplify_app" "web_app" {
  name        = var.app_name
  repository  = var.github_repository
  oauth_token = var.oauth_token

  environment_variables = {
    ENV = "dev"
    API_GATEWAY_URL   = var. API_GATEWAY_URL
  }
  
   build_spec = <<-EOT
  version: 1
  frontend:
    phases:
      preBuild:
        commands:
          - mkdir -p public  # Ensure 'public' directory exists
          - echo "window.apiGatewayUrl='$API_GATEWAY_URL';" > public/config.js
      build:
        commands:[]
    artifacts:
      baseDirectory: .
      files:
        - '**/*'
    cache:
      paths:[]
    
    EOT

  auto_branch_creation_config {

    enable_auto_build           = true
    enable_pull_request_preview = true

  }
  tags = {
    Project     = "WebAppDeployment"
    Environment = "Development"
  }
}


resource "aws_amplify_branch" "dev_branch" {
  app_id      = aws_amplify_app.web_app.id
  branch_name = "dev"

  environment_variables = {
    NODE_ENV = "development"
    API_GATEWAY_URL   = var. API_GATEWAY_URL
  }
  enable_auto_build = true
}































