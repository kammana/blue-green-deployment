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
variable "instance_type" {
  default = "t2.micro"
}

variable "blue_health" {
  type = map(any)
  default = {
    interval        = 30
    path            = "/"
    port            = "80"
    protocol        = "HTTP"
    timeout         = 2
    target_port     = 80
    target_protocol = "HTTP"
  }
}

variable "green_health" {
  type = map(any)
  default = {
    interval        = 30
    path            = "/"
    port            = "80"
    protocol        = "HTTP"
    timeout         = 2
    target_port     = 80
    target_protocol = "HTTP"
  }
}
variable "web_sg" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [{
    cidr_blocks = ["10.0.0.0/8"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    },
    {
      cidr_blocks = ["10.0.0.0/8"]
      from_port   = 22
      protocol    = "tcp"
      to_port     = 22
  }]
}