# Application variables
variable "app_image" {
  type        = string
  description = "Application image"
  default     = "juliocesarmidia/todo-vue"
}

variable "app_version" {
  type        = string
  description = "Application version"
  default     = "v2.0.0"
}

variable "app_env" {
  type        = string
  description = "Application environment"
  default     = "production"
}

variable "app_replica_count" {
  type        = number
  description = "Application replicas number"
  default     = 3
}

variable "app_namespace" {
  type        = string
  description = "Application namespace"
  default     = "blackdevs"
}

# AWS variables
variable "aws_access_key" {
  type        = string
  description = "AWS Access Key ID"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Access Key"
}

variable "aws_region" {
  type        = string
  description = "AWS Secret Access Key"
  default     = "sa-east-1"
}

variable "aws_hosted_zone_id" {
  type        = string
  description = "AWS hosted zone ID"
}

# K8S
variable "kubeconfig" {
  type        = string
  description = "Kube config file"
  default     = "k8s-cluster-kubeconfig.yaml"
}
