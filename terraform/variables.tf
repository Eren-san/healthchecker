variable "region" {
  type = string
  description = "The AWS region to deploy resources"
  default     = "eu-central-1"
}

variable "instance_type" {
  type        = string
  description = "The instance type to use for the EC2 instance"
  default     = "t2.micro"
  
}

variable "key_name" {
  type        = string
  description = "The name of the key pair to use for SSH access"
  default     = "healthchecker-key"
}
