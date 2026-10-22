variable "vpc_config" {
    description           = "To get CIDR and Name of VPC from user"
    type                  = object({
      cidr_block          = string
      name                = string 
    })

    validation {
      condition = can(cidrnetmask(var.vpc_config.cidr_block))
      error_message = "Invalid CIDR Format - ${var.vpc_config.cidr_block}"
    }
  
}

variable "subnet_config" {
    description = "get cidr and AZs for subnets"
    type = map(object({
      cidr_block = string
      AZs = string
      public = optional(bool, false)
    }))

    validation {
      condition = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
      error_message = "Invalid CIDR Format"
    }
}