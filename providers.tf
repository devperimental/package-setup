terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "devperimental"

    workspaces {
      name = "package-setup"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

provider "github" {
  token = var.GITHUB_TOKEN
}