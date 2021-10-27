# variable "env" {
#   type = string
#   description = "Env to deploy to"
#   default = "dev"
# }

variable "image" {
  type = map
  description = "Image for container"
  default = {
  nodered = {
    dev = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
  influxdb = {
    dev = "quay.io/influxdb/influxdb:v2.0.2"
    prod = "quay.io/influxdb/influxdb:v2.0.2"
  }}
}

variable "ext_port" {
  type = map
  
  # validation {
  #   condition = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) > 0
  #   error_message = "The ext port should be between 65535 and Zero."
  # }
  # validation {
  #   condition = max(var.ext_port["prod"]...) <= 65535 && min(var.ext_port["prod"]...) > 0
  #   error_message = "The ext port should be between 65535 and Zero."
  # }
}

variable "int_port" {
  type = number
  default = 1880
  
  validation {
    condition = var.int_port == 1880
    error_message = "The internal port must be 8080."
  }
}


# locals {
#   container_count = length(var.ext_port[terraform.workspace])
# }