variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-west-2"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS instance type"
}