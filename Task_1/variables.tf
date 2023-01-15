variable "ami-id" {
  description = "ami id"
  type        = string
  default     = "ami-0b5eea76982371e91"
}

variable "task-key" {
  type        = string
  default     = "task-key"
  description = "Key Pair Name"
}

variable "instance-size" {
  type        = string
  default     = "t2.micro"
  description = "EC2 Instance Type"
}

variable "vpc-cidr" {
  default     = "10.0.0.0/16"
  description = "Public Subnet CIDR values"
}

variable "azs" {
  type        = list(any)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  description = "Availability Zones"
}

variable "task-tags" {
  type = map(any)
  default = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Alex_Patrascu"
  }
  description = "Resource Tags"
}
