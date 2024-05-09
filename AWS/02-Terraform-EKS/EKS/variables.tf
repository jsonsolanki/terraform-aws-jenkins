variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "cluster_name" {
  default     = "gitlab-terraform-eks"
  description = "EKS Cluster name"
}

variable "cluster_version" {
  default     = "1.24"
  description = "Kubernetes version"
}

# Enter Image Owner name either id
variable "owner" {
    default = "amazon"
    type = string
}

variable "instance_type" {
  default     = "t3.small"
  description = "EKS node instance type"
}

variable "instance_count" {
  default     = 3
  description = "EKS node count"
}

variable "agent_namespace" {
  default     = "gitlab-agent"
  description = "Kubernetes namespace to install the Agent"
}

variable "agent_token" {
  default = "glagent-ySYVQ3TKWRWsP3zLh-Lk9mku2qLHtUU_uz5_mMx7HvZcsUb2WA"
  description = "Agent token (provided after registering an Agent in GitLab)"
  sensitive   = true
}

variable "kas_address" {
  default = "wss://kas.gitlab.com"
  description = "Agent Server address (provided after registering an Agent in GitLab)"
}
