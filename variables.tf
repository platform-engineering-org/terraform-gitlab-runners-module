variable "aws_region_1" {
  description = "AWS region."
  type        = string
  default     = "eu-west-2"
}

variable "aws_profile_1" {
  description = "AWS profile."
  type        = string
  default     = "default"
}

variable "aws_region_2" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "aws_profile_2" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "token" {
  type        = string
  description = "Gitlab token"
  sensitive   = true
}

variable "insecure" {
  type        = string
  description = "Do not verify certifcate if true"
}

variable "base_url" {
  type        = string
  description = "gitlab api end point"
}

variable "environment" {
  description = "A name that identifies the environment, will used as prefix and for tagging."
  type        = string
  default     = "dev"
}

variable "runner_name" {
  description = "Name of the runner, will be used in the runner config.toml"
  type        = string
  default     = "pe-runner"
}

variable "gitlab_url" {
  description = "URL of the gitlab instance to connect to."
  type        = string
  default     = "https://gitlab.com"
}

variable "registration_token_runner_1" {
  description = "Registration token for the runner."
  type        = string
}

variable "registration_token_runner_2" {
  description = "Registration token for the runner."
  type        = string
}

variable "registration_token_runner_3" {
  description = "Registration token for the runner."
  type        = string
}

variable "timezone" {
  description = "Name of the timezone that the runner will be used in."
  type        = string
  default     = "Europe/Amsterdam"
}

variable "project" {
  description = "Project Name"
  type        = string
  default     = "Platform Engineering"
}

variable "user" {
  description = "User name"
  type        = string
}

variable "docker-machine-types" {
  description = "Gitlab runner docker machine type"
  type        = list(string)
  default     = ["t3.micro"]
}
