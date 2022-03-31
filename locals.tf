locals {
  vpc_id              = "vpc-0ece1c90642eb015a"
  private_a_subnet_id = "subnet-08afcecde3675a804"
  public_a_subnet_id  = "subnet-0b12bd492f9bea1e0"
  public_b_subnet_id  = "subnet-0a3104ba4ff98c0f1"

  ubuntu_ami = "ami-0c02fb55956c7d316"

  traffic_dist_map = {
    blue = {
      blue  = 100
      green = 0
    }
    blue-90 = {
      blue  = 90
      green = 10
    }
    split = {
      blue  = 50
      green = 50
    }
    green-90 = {
      blue  = 10
      green = 90
    }
    green = {
      blue  = 0
      green = 100
    }
  }
}