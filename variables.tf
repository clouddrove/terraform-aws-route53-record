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

variable "type" {
  type        = string
  default     = ""
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT. "
}

variable "ttl" {
  type        = number
  default     = null
  description = "(Required for non-alias records) The TTL of the record."
}

variable "name" {
  type        = string
  default     = ""
  description = "The name of the record."
}

variable "values" {
  type        = string
  default     = ""
  description = "(Required for non-alias records) A string list of records. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add \"\" inside the Terraform configuration string (e.g. \"first255characters\"\"morecharacters\")."
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

variable "alias" {
  type        = map(any)
  default     = {}
  description = "An alias block. Conflicts with ttl & records. Alias record documented below."
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

variable "zone_id" {
  type        = string
  description = "Zone ID."
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


