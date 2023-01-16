variable "ami_id" {
  type        = string
  default     = "ami-0b5eea76982371e91"
  description = "EC2 instance AMI"
}

variable "ec2_count" {
  type        = number
  default     = "3"
  description = "Number of EC2 instances to create"
}


variable "task_key" {
  type        = string
  default     = "task_key"
  description = "Key Pair Name"
}

variable "instance_size" {
  type        = string
  default     = "t2.micro"
  description = "EC2 Instance Type"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "CIDR for VPC"
}

variable "public_subnets" {
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "CIDR for the public subnet"
}

variable "azs" {
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "Availability Zones"
}

variable "task_tags" {
  type = map(any)
  default = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Alex_Patrascu"
  }
  description = "Resource Tags"
}
