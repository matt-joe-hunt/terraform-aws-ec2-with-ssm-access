variable "region-master" {
  type    = string
  default = "eu-west-2"
}

variable "project" {
  type        = string
  description = "name of the project for consistent naming"
}

variable "instance_type" {
  type        = string
  description = "The instance type to be used"
}

variable "ami_id" {
  type        = string
  description = "The ami id to be used"
}