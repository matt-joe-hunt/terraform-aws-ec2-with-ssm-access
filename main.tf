provider "aws" {
  region = var.region-master
}
module "EC2" {
  source = "./modules/EC2"

  project       = var.project[terraform.workspace]
  instance_type = var.instance_type[terraform.workspace]
  ami_id        = var.ami_id[terraform.workspace]

}