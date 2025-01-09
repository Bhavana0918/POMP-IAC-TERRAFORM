# variable "hosting_bucket" {
#   type        = string
# }
# variable "index_file_path" {
#   type        = string
# }

variable "app_name" {
  description = "The name of the Amplify app."
  type        = string
}

# variable "access_token" {
#   type = string
  
# }

variable "oauth_token" {
  type = string 
}


variable "github_repository" {
  type = string 
}