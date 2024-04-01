terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.43.0"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.10.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}
