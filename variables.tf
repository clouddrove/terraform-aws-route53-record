# Module      : Route53 table
# Description : Terraform Route53 table module variables.
variable "record_default_enabled" {
  type        = bool
  default     = true
  description = "Whether to create Route53 record set."
}


variable "record_alias_enabled" {
  type        = bool
  default     = true
  description = "Whether to create Route53 alias record set."
}


variable "set_identifier" {
  type        = string
  default     = null
  description = "Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies documented below."
}

variable "health_check_id" {
  type        = string
  default     = ""
  description = "The health check the record should be associated with."
}

variable "multivalue_answer_routing_policy" {
  type        = bool
  default     = null
  description = "Set to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy."
}

variable "allow_overwrite" {
  type        = bool
  default     = false
  description = "Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments."
}


variable "records" {
  description = "Specifies values for route53 private alias records"
  type = map(object({
    zone_id = string
    name    = string
    type    = string
    alias   = map(string)
    }
  ))
}

variable "default_records" {
  description = "Specifies values for route53 private alias records"
  type = map(object({
    records = set(string)
    zone_id = string
    ttl     = number
    name    = string
    type    = string

    }
  ))
}


