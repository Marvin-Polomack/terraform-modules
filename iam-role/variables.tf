variable "github_org" {
  description = "Name of GitHub organization/user (case sensitive)"
  type        = string
}

variable "repository_name" {
  description = "Name of GitHub repository (case sensitive)"
  type        = string
}

variable "oidc_provider_arn" {
  description = "Arn for the GitHub OIDC Provider."
  type        = string
  default     = ""
}

variable "create_oidc" {
  description = "Create the GitHub OIDC Provider."
  type        = bool
  default     = false
}

variable "oidc_audience" {
  description = "Audience supplied to configure-aws-credentials."
  type        = string
  default     = "sts.amazonaws.com"
}