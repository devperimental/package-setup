variable "config_file" {
  type        = string
  description = "config file"
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "nuget_pat" {
  type      = string
  sensitive = true
}

variable "aws_secret_access_key" {
  type      = string
  sensitive = true
}

variable "aws_access_key_id" {
  type      = string
  sensitive = true
}