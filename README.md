### EC2 deployment with SSM access

For more details on this module, please check the following Blog Post:

https://35.178.199.137/2021/05/05/ec2-deployment-with-ssm-access/

## Summary

You can use this structure to deploy a simple EC2 instance with Terraform.  As part of this deployment, you will also be able to securely access your instance by using SSM.

SSM allows you to securely access an EC2 instance without requiring a Bastion Host, making it easier to configure and maintain.  You will also not be required to manage SSH Keys or work with an SSH client in order to access the instance.

## Instructions

In a new directory, create a file called *main.tf* with the following content.

```
provider "aws" {
  region = var.region
}

module "ec2-with-ssm-access" {
  source  = "matt-joe-hunt/ec2-with-ssm-access/aws"
  version = "1.0.4"

  # At time of writing 1.0.4 was latest version
}
```

With Terraform installed on your machine, deploy the module by running the following commands, ensuring that you check and understand the changes that are being made with *terraform apply* before you confirm them.

```
terraform init
terraform apply
```
