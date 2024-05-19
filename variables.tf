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

variable "runner_worker_docker_machine_instance_types" {
  description = "Gitlab runner docker machine type"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "runner_instance_type" {
  description = "Runner Instance Type"
  type        = string
  default     = "t3.medium"
}

variable "runner_ami_filter" {
  description = "List of maps used to create the AMI filter for the Runner AMI. Must resolve to an Amazon Linux 1 or 2 image."
  type        = map(list(string))

  default = {
    name = ["amzn2-ami-hvm-2.*-x86_64-ebs"]
  }
}

variable "runner_worker_docker_machine_ami_filter" {
  description = "List of maps used to create the AMI filter for the Runner Worker."
  type        = map(list(string))

  default = {
    name = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

variable "runner_worker_docker_machine_ami_owners" {
  description = "The list of owners used to select the AMI of the Runner Worker."
  type        = list(string)
  default     = ["099720109477"]
}

variable "runner_worker_docker_machine_instance_root_size" {
  description = "The size of the root volume for the Runner Worker"
  type        = number
  default     = 8
}

variable "runner_version" {
  description = "Gitlab runner version"
  type        = string
  default     = "16.4.1"  // renovate: packageName=gitlab-org/gitlab-runner
}
