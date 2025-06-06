variable "name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "description" {
  description = "The description of the IAM policy"
  type        = string
  default     = "Managed by Terraform"
}

variable "actions" {
  description = "List of IAM actions to allow"
  type        = list(string)
}

variable "resources" {
  description = "List of resource ARNs the policy applies to"
  type        = list(string)
  default     = ["*"]
}

variable "role_id" {
  description = "The ARN of the IAM role to attach the policy to"
  type        = string
  default = null
}