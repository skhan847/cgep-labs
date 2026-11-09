# terraform/baselines/gcp/variables.tf
variable "gcp_project" { type = string }
variable "github_repo" {
  type        = string
  description = "OWNER/REPO that the WIF provider will trust."
}
variable "enable_org_policies" {
  description = "Org Policy needs a GCP Organization; this project has none"
  type        = bool
  default     = false
}