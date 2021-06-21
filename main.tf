provider "aws" {
  region = var.region
}
module "EC2" {
  source = "./modules/EC2"

  project       = var.project
  instance_type = var.instance_type
  ami_id        = var.ami_id
}