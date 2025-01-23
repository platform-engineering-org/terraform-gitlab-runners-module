data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_security_group" "default" {
  name   = var.sg_name == null ? "default" : var.sg_name
  vpc_id = var.vpc_id == null ? module.vpc.vpc_id : var.vpc_id
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.17.0"

  name = "vpc-${var.environment}"
  cidr = "10.0.0.0/16"

  create_vpc = var.vpc_id == null ? true : false

  azs                     = [data.aws_availability_zones.available.names[0]]
  private_subnets         = ["10.0.1.0/24"]
  public_subnets          = ["10.0.101.0/24"]
  map_public_ip_on_launch = false

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Environment = var.environment
    Project     = var.project
    User        = var.user
  }
}

module "vpc_endpoints" {
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "5.17.0"

  vpc_id = var.vpc_id == null ? module.vpc.vpc_id : var.vpc_id

  endpoints = {
    s3 = {
      service = "s3"
      tags    = { Name = "s3-vpc-endpoint" }
    }
  }

  tags = {
    Environment = var.environment
    Project     = var.project
    User        = var.user
  }
}

resource "random_id" "unique_prefix" {
  byte_length = 4
}

module "runner-instance" {
  source  = "cattle-ops/gitlab-runner/aws"
  version = "8.1.0"

  environment       = var.environment
  iam_object_prefix = random_id.unique_prefix.hex

  subnet_id = var.subnet_id == null ? element(module.vpc.private_subnets, 0) : var.subnet_id
  vpc_id    = var.vpc_id == null ? module.vpc.vpc_id : var.vpc_id

  runner_ami_filter                       = var.runner_ami_filter
  runner_worker_docker_machine_ami_filter = var.runner_worker_docker_machine_ami_filter
  runner_worker_docker_machine_ami_owners = var.runner_worker_docker_machine_ami_owners

  runner_manager = {
    maxiumum_concurrent_jobs = var.runner_manager_maximum_concurrent_jobs
  }

  runner_gitlab_registration_config = {
    type              = "group"
    group_id          = var.gitlab_group_id
    tag_list          = var.tag_list
    description       = "Docker Machine"
    locked_to_project = "true"
    run_untagged      = "false"
    maximum_timeout   = "3600"
  }

  runner_worker_cache = {
    create     = "true"
    versioning = "true"
    shared     = "true"
  }

  tags = {
    "Project" = var.project
    "User"    = var.user
  }

  runner_worker_docker_volumes_tmpfs = [
    {
      volume  = "/var/opt/cache",
      options = "rw,noexec"
    }
  ]

  runner_worker_docker_services_volumes_tmpfs = [
    {
      volume  = "/var/lib/mysql",
      options = "rw,noexec"
    }
  ]

  # working 9 to 5 :)
  runner_worker_docker_machine_autoscaling_options = [
    {
      periods    = ["* * 0-9,17-23 * * mon-fri *", "* * * * * sat,sun *"]
      idle_count = 0
      idle_time  = 60
      timezone   = var.timezone
    }
  ]

  runner_worker_docker_options = {
    privileged = "true"
    volumes    = ["/cache", "/certs/client"]
  }

  runner_instance = {
    collect_autoscaling_metrics = ["GroupDesiredCapacity", "GroupInServiceCapacity"]
    name                        = "pe-runners"
    name_prefix                 = "${var.runner_name}"
    ssm_access                  = true
    type                        = var.runner_instance_type
  }

  runner_worker = {
    ssm_access   = true
    output_limit = var.runner_worker_log_output_limit
  }

  runner_cloudwatch = {
    enable         = "true"
    log_group_name = "${var.runner_name}"
  }

  runner_gitlab = {
    url                                      = var.gitlab_url
    runner_version                           = var.runner_version
    access_token_secure_parameter_store_name = var.access_token_secure_parameter_store_name
  }

  runner_worker_docker_machine_instance_spot = {
    enable    = var.enable
    max_price = "on-demand-price"
  }

  runner_worker_docker_machine_instance = {
    types     = var.runner_worker_docker_machine_instance_types
    root_size = var.runner_worker_docker_machine_instance_root_size
  }

  runner_networking = {
    allow_incoming_ping_security_group_ids = [data.aws_security_group.default.id]
  }

  runner_gitlab_token_secure_parameter_store = "runner-token"
  runner_sentry_secure_parameter_store_name  = "sentry-dsn"
  runner_terminate_ec2_lifecycle_hook_name   = "terminate-instances"
}
