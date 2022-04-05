variable "enable_blue_env" {
  description = "Enable blue environment"
  type        = bool
  default     = false
}

variable "blue_instance_count" {
  description = "Number of instances in blue environment"
  type        = number
  default     = 2
}

variable "enable_green_env" {
  description = "Enable green environment"
  type        = bool
  default     = true
}

variable "green_instance_count" {
  description = "Number of instances in green environment"
  type        = number
  default     = 2
}

variable "traffic_distribution" {
  description = "Levels of traffic distribution"
  type        = string
}
variable "vpc_id" {
  default = "vpc-0ece1c90642eb015a"
}
variable "private_subnet_ids" {
  default = ["subnet-08afcecde367a804", "subnet-0b12bd492f9bea1e0", "subnet-0a3104ba4ff98c0f1"]
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316"
}
