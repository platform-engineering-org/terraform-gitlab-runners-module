provider "gitlab" {
  token    = var.token
  base_url = var.base_url
  insecure = var.insecure
}

provider "local" {}

provider "null" {}

provider "tls" {}

provider "random" {}
