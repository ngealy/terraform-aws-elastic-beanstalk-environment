variable "region" {
  type        = string
  description = "AWS region"
}

variable "namespace" {
  type        = string
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage, e.g. 'prod', 'staging', 'dev', or 'test'"
  default     = ""
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'cluster'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "description" {
  type        = string
  default     = ""
  description = "Short description of the Environment"
}

variable "elastic_beanstalk_application_name" {
  type        = string
  description = "Elastic Beanstalk application name"
}

variable "environment_type" {
  type        = string
  default     = "LoadBalanced"
  description = "Environment type, e.g. 'LoadBalanced' or 'SingleInstance'.  If setting to 'SingleInstance', `rolling_update_type` must be set to 'Time', `updating_min_in_service` must be set to 0, and `loadbalancer_subnets` will be unused (it applies to the ELB, which does not exist in SingleInstance environments)"
}

variable "loadbalancer_type" {
  type        = string
  default     = "classic"
  description = "Load Balancer type, e.g. 'application' or 'classic'"
}

variable "dns_zone_id" {
  type        = string
  default     = ""
  description = "Route53 parent zone ID. The module will create sub-domain DNS record in the parent zone for the EB environment"
}

variable "allowed_security_groups" {
  type        = list(string)
  description = "List of security groups to be allowed to connect to the EC2 instances"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC in which to provision the AWS resources"
}

variable "loadbalancer_subnets" {
  type        = list(string)
  description = "List of subnets to place Elastic Load Balancer"
  default     = []
}

variable "application_subnets" {
  type        = list(string)
  description = "List of subnets to place EC2 instances"
}

variable "availability_zone_selector" {
  type        = string
  default     = "Any 2"
  description = "Availability Zone selector"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instances type"
}

variable "enhanced_reporting_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable \"enhanced\" health reporting for this environment.  If false, \"basic\" reporting is used.  When you set this to false, you must also set `enable_managed_actions` to false"
}

variable "managed_actions_enabled" {
  type        = bool
  default     = true
  description = "Enable managed platform updates. When you set this to true, you must also specify a `PreferredStartTime` and `UpdateLevel`"
}

variable "autoscale_min" {
  type        = number
  default     = 2
  description = "Minumum instances to launch"
}

variable "autoscale_max" {
  type        = number
  default     = 3
  description = "Maximum instances to launch"
}

variable "solution_stack_name" {
  type        = string
  description = "Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. For more info, see https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html"
}

variable "wait_for_ready_timeout" {
  type        = string
  default     = "20m"
  description = "The maximum duration to wait for the Elastic Beanstalk Environment to be in a ready state before timing out"
}

variable "associate_public_ip_address" {
  type        = bool
  default     = false
  description = "Whether to associate public IP addresses to the instances"
}

variable "tier" {
  type        = string
  default     = "WebServer"
  description = "Elastic Beanstalk Environment tier, 'WebServer' or 'Worker'"
}

variable "version_label" {
  type        = string
  default     = ""
  description = "Elastic Beanstalk Application version to deploy"
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Force destroy the S3 bucket for load balancer logs"
}

variable "rolling_update_enabled" {
  type        = bool
  default     = true
  description = "Whether to enable rolling update"
}

variable "rolling_update_type" {
  type        = string
  default     = "Health"
  description = "`Health` or `Immutable`. Set it to `Immutable` to apply the configuration change to a fresh group of instances"
}

variable "updating_min_in_service" {
  type        = number
  default     = 1
  description = "Minimum number of instances in service during update"
}

variable "updating_max_batch" {
  type        = number
  default     = 1
  description = "Maximum number of instances to update at once"
}

variable "health_streaming_enabled" {
  type        = bool
  default     = false
  description = "For environments with enhanced health reporting enabled, whether to create a group in CloudWatch Logs for environment health and archive Elastic Beanstalk environment health data. For information about enabling enhanced health, see aws:elasticbeanstalk:healthreporting:system."
}

variable "health_streaming_delete_on_terminate" {
  type        = bool
  default     = false
  description = "Whether to delete the log group when the environment is terminated. If false, the health data is kept RetentionInDays days."
}

variable "health_streaming_retention_in_days" {
  type        = number
  default     = 7
  description = "The number of days to keep the archived health data before it expires."
}

variable "healthcheck_url" {
  type        = string
  default     = "/healthcheck"
  description = "Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances"
}

variable "enable_log_publication_control" {
  type        = bool
  default     = false
  description = "Copy the log files for your application's Amazon EC2 instances to the Amazon S3 bucket associated with your application"
}

variable "enable_stream_logs" {
  type        = bool
  default     = false
  description = "Whether to create groups in CloudWatch Logs for proxy and deployment logs, and stream logs from each instance in your environment"
}

variable "logs_delete_on_terminate" {
  type        = bool
  default     = false
  description = "Whether to delete the log groups when the environment is terminated. If false, the logs are kept RetentionInDays days"
}

variable "logs_retention_in_days" {
  type        = number
  default     = 7
  description = "The number of days to keep log events before they expire."
}

variable "loadbalancer_certificate_arn" {
  type        = string
  default     = ""
  description = "Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager"
}

variable "loadbalancer_ssl_policy" {
  type        = string
  default     = ""
  description = "Specify a security policy to apply to the listener. This option is only applicable to environments with an application load balancer"
}

variable "loadbalancer_security_groups" {
  type        = list(string)
  default     = []
  description = "Load balancer security groups"
}

variable "loadbalancer_managed_security_group" {
  type        = string
  default     = ""
  description = "Load balancer managed security group"
}

variable "http_listener_enabled" {
  type        = bool
  default     = true
  description = "Enable port 80 (http)"
}

variable "application_port" {
  type        = number
  default     = 80
  description = "Port application is listening on"
}

variable "preferred_start_time" {
  type        = string
  default     = "Sun:10:00"
  description = "Configure a maintenance window for managed actions in UTC"
}

variable "update_level" {
  type        = string
  default     = "minor"
  description = "The highest level of update to apply with managed platform updates"
}

variable "instance_refresh_enabled" {
  type        = bool
  default     = true
  description = "Enable weekly instance replacement."
}

variable "keypair" {
  type        = string
  description = "Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS"
  default     = ""
}

variable "root_volume_size" {
  type        = number
  default     = 8
  description = "The size of the EBS root volume"
}

variable "root_volume_type" {
  type        = string
  default     = "gp2"
  description = "The type of the EBS root volume"
}

variable "autoscale_measure_name" {
  type        = string
  default     = "CPUUtilization"
  description = "Metric used for your Auto Scaling trigger"
}

variable "autoscale_statistic" {
  type        = string
  default     = "Average"
  description = "Statistic the trigger should use, such as Average"
}

variable "autoscale_unit" {
  type        = string
  default     = "Percent"
  description = "Unit for the trigger measurement, such as Bytes"
}

variable "autoscale_lower_bound" {
  type        = number
  default     = 20
  description = "Minimum level of autoscale metric to remove an instance"
}

variable "autoscale_lower_increment" {
  type        = number
  default     = -1
  description = "How many Amazon EC2 instances to remove when performing a scaling activity."
}

variable "autoscale_upper_bound" {
  type        = number
  default     = 80
  description = "Maximum level of autoscale metric to add an instance"
}

variable "autoscale_upper_increment" {
  type        = number
  default     = 1
  description = "How many Amazon EC2 instances to add when performing a scaling activity"
}

variable "elb_scheme" {
  type        = string
  default     = "public"
  description = "Specify `internal` if you want to create an internal load balancer in your Amazon VPC so that your Elastic Beanstalk application cannot be accessed from outside your Amazon VPC"
}

variable "ssh_source_restriction" {
  type        = string
  default     = "0.0.0.0/0"
  description = "Used to lock down SSH access to the EC2 instances"
}

variable "ssh_listener_enabled" {
  type        = bool
  default     = false
  description = "Enable SSH port"
}

variable "ssh_listener_port" {
  type        = number
  default     = 22
  description = "SSH port"
}

variable "additional_settings" {
  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))

  default     = []
  description = "Additional Elastic Beanstalk setttings. For full list of options, see https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options-general.html"
}

variable "env_vars" {
  type        = map(string)
  default     = {}
  description = "Map of custom ENV variables to be provided to the application running on Elastic Beanstalk, e.g. env_vars = { DB_USER = 'admin' DB_PASS = 'xxxxxx' }"
}

# From: http://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region
# Via: https://github.com/hashicorp/terraform/issues/7071
variable "alb_zone_id" {
  type = map(string)

  default = {
    ap-northeast-1 = "Z1R25G3KIG2GBW"
    ap-northeast-2 = "Z3JE5OI70TWKCP"
    ap-south-1     = "Z18NTBI3Y7N9TZ"
    ap-southeast-1 = "Z16FZ9L249IFLT"
    ap-southeast-2 = "Z2PCDNR3VC2G1N"
    ca-central-1   = "ZJFCZL7SSZB5I"
    eu-central-1   = "Z1FRNW7UH4DEZJ"
    eu-west-1      = "Z2NYPWQ7DFZAZH"
    eu-west-2      = "Z1GKAAAUGATPF1"
    sa-east-1      = "Z10X7K2B4QSOFV"
    us-east-1      = "Z117KPS5GTRQ2G"
    us-east-2      = "Z14LCN19Q5QHIC"
    us-west-1      = "Z1LQECGX5PH1X"
    us-west-2      = "Z38NKT9BP95V3O"
    eu-west-3      = "ZCMLWB8V5SYIT"
  }

  description = "ALB zone id"
}
