provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

provider "gitlab"{
  token    = var.token
  base_url = var.base_url
  insecure = var.insecure
}

provider "local" {}

provider "null" {}

provider "tls" {}

provider "random" {}
