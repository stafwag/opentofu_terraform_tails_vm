variable "name" {
  description = "Virtual machine name"
  default     = "mytails"
  type        = string
}

variable "memory" {
  description = "Virtual machine memory"
  default     = 4096
  type        = number
}

variable "cpus" {
  description = "Virtual machine vcpus"
  default     = 2
  type        = number
}
