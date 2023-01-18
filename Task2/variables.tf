variable "common_tags" {
  type = map(any)
  default = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Alex_Patrascu"
  }
  description = "Resourse tags"
}
