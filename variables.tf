variable "aws_region" {
  description = "AWS region."
  type        = string
}

variable "aws_profile" {
  description = "AWS profile."
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
  default     = true
}

variable "base_url" {
  type        = string
  description = "gitlab api end point"
  default     = "https://gitlab.com/api/v4/"
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

variable "registration_token_runner" {
  description = "Registration token for the runner."
  type        = string
  sensitive   = true
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

variable "runner_version" {
  description = "Gitlab runner version"
  type        = string
  default     = "16.4.1"
}

variable "runners_root_size" {
  description = "Gitlab runner root filesystem size"
  type        = number
  default     = 8
}

variable "role_profile_name" {
  description = "IAM Role Profile Name"
  type        = string
  default     = "dev-gitlab-runners"
}
