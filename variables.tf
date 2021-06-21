variable "region-master" {
  type    = string
  default = "eu-west-2"
}

variable "project" {
  type        = map(string)
  description = "name of the project for consistent naming"
}

variable "instance_type" {
  type        = map(string)
  description = "The instance type to be used"
}

variable "ami_id" {
  type        = map(string)
  description = "The ami id to be used"
}