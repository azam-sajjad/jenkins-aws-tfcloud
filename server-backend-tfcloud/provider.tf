terraform {
  cloud {
    organization = "eurusvm"
    workspaces {
      name = "jenkins-server-us-east-1"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.ACCESS_KEY
  secret_key = var.SECRET_KEY
}