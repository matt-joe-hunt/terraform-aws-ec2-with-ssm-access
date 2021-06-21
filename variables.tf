variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "project" {
  type        = string
  default     = "default"
  description = "name of the project for consistent naming"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The instance type to be used"
}

variable "ami_id" {
  type        = string
  default     = "null"
  description = "The ami id to be used, if 'null' will use latest Amazon Linux 2 image"
}