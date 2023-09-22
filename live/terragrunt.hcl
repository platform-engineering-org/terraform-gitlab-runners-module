remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "pe-tf-backend"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-2"
    profile        = "default"
    encrypt        = true
    dynamodb_table = "pe-tf-backend"
    s3_bucket_tags = {
      "Project" = "Platform Engineering"
      "User"    = "lmilbaum"
    }
    dynamodb_table_tags = {
      "Project" = "Platform Engineering"
      "User"    = "lmilbaum"
    }
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
   region = var.aws_region
   profile = var.aws_profile
  default_tags {
    tags = { "Project" = "Platform Engineering", "User" = "lmilbaum" }
  }
}
EOF
}
