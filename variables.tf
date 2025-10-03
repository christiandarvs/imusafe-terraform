variable "aws_region" {
  description = "AWS Region of the Project"
  type        = string
  default     = "ap-southeast-2"
}

variable "instance_ami" {
  description = "AMI of the EC2 Instance"
  type        = string
  default     = "ami-0279a86684f669718"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.small"
}

variable "cidr" {
  description = "CIDR Blocks of the EC2 Instance Security Group"
  type        = string
  default     = "0.0.0.0/0"
}
