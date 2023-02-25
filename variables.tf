variable "config_file" {
  type        = string
  description = "config file"
}

variable "GITHUB_TOKEN" {
  type      = string
  sensitive = true
}

variable "NUGET_PAT" {
  type      = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type      = string
  sensitive = true
}

variable "AWS_ACCESS_KEY_ID" {
  type      = string
  sensitive = true
}