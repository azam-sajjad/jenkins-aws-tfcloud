terraform {
  backend "s3" {
    bucket = "jenkins-server-statefile"
    key = "statefile/jenkins-server"
    region = "us-east-1"
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["/home/azams/.aws/credentials"]
}