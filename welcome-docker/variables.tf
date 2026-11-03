#Variables 
variable "int_port" {
  type        = number
  description = "Int Ports"
  validation {
    condition     = var.int_port == 80
    error_message = "Internal Port Must Be 80"
  }
}

#External Port
variable "prod_ext_port" {
  type        = list(number)
  description = "Ext Ports"
  validation {
    condition     = min(var.prod_ext_port...) >= 8000 && max(var.prod_ext_port...) <= 8005
    error_message = "External Port Must be between 8000 and 8010"
  }
}

variable "stg_ext_port" {
  type        = list(number)
  description = "Ext Ports"
  validation {
    condition     = min(var.stg_ext_port...) >= 8006 && max(var.stg_ext_port...) <= 8010
    error_message = "External Port Must be between 8000 and 8010"
  }
}

variable "prod_container_image" {
  type        = string
  description = "Container Image"
}

variable "stg_container_image" {
  type        = string
  description = "Container Image"
}

variable "container_count" {
  type        = number
  description = "Container Count"
  validation {
    condition     = var.container_count > 0 && var.container_count <= 3
    error_message = "Countainer Count Must Between 1 and 3"
  }
}