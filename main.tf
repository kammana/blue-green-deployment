provider "aws" {
  region = "us-east-1"
}
module "blue_green" {
    source = "./modules/blue-green"
    traffic_distribution = "blue"
}