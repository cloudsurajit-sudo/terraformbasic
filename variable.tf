variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-1"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}