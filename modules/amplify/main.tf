resource "aws_amplify_app" "web_app" {
  name       = var.app_name                      
  repository = var.github_repository             
  oauth_token  = var.oauth_token        

  environment_variables = {
    ENV = "dev"                                
  }

  auto_branch_creation_config {
                         
    enable_auto_build      = true 
    enable_pull_request_preview = true                 
         
  }


  
  tags = {
    Project = "WebAppDeployment"
    Environment = "Development"
  }
}


resource "aws_amplify_branch" "dev_branch" {
  app_id      = aws_amplify_app.web_app.id      
  branch_name = "dev"                            

  environment_variables = {
    NODE_ENV = "development"                    
  }

  enable_auto_build = true                      
}































