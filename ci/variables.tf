variable "app_image" {
  type        = string
  description = "Image"
}

variable "app_port" {
  type        = string
  description = "Port"
}

variable "app_version" {
  type        = string
  description = "Version"
}

variable "app_config" {
  type = object({
    NODE_ENV = string
  })
}

variable "kubeconfig" {
  type        = string
  description = "Kube config file"
  default     = "k8s-cluster-kubeconfig.yaml"
}
