## Managed By : CloudDrove
## Copyright @ CloudDrove. All Right Reserved.

# Module      : Route53 Record Set
# Description : Terraform module to create Route53 record sets resource on AWS.
resource "aws_route53_record" "default" {
  count                            = var.record_enabled && length(var.ttls) > 0 ? length(var.ttls) : 0
  zone_id                          = var.zone_id
  name                             = element(var.names, count.index)
  type                             = element(var.types, count.index)
  ttl                              = element(var.ttls, count.index)
  records                          = split(",", element(var.values, count.index))
  set_identifier                   = length(var.set_identifiers) > 0 ? element(var.set_identifiers, count.index) : ""
  health_check_id                  = length(var.health_check_ids) > 0 ? element(var.health_check_ids, count.index) : ""
  multivalue_answer_routing_policy = length(var.multivalue_answer_routing_policies) > 0 ? element(var.multivalue_answer_routing_policies, count.index) : null
  allow_overwrite                  = length(var.allow_overwrites) > 0 ? element(var.allow_overwrites, count.index) : false
}

# Module      : Route53 Record Set
# Description : Terraform module to create Route53 record sets resource on AWS.
resource "aws_route53_record" "alias" {
  count                            = var.record_enabled && length(var.alias) > 0 && length(var.alias["names"]) > 0 ? length(var.alias["names"]) : 0
  zone_id                          = var.zone_id
  name                             = element(var.names, count.index)
  type                             = element(var.types, count.index)
  set_identifier                   = length(var.set_identifiers) > 0 ? element(var.set_identifiers, count.index) : ""
  health_check_id                  = length(var.health_check_ids) > 0 ? element(var.health_check_ids, count.index) : ""
  multivalue_answer_routing_policy = length(var.multivalue_answer_routing_policies) > 0 ? element(var.multivalue_answer_routing_policies, count.index) : null
  allow_overwrite                  = length(var.allow_overwrites) > 0 ? element(var.allow_overwrites, count.index) : false
  alias {
    name                   = length(var.alias) > 0 ? element(var.alias["names"], count.index) : ""
    zone_id                = length(var.alias) > 0 ? element(var.alias["zone_ids"], count.index) : ""
    evaluate_target_health = length(var.alias) > 0 ? element(var.alias["evaluate_target_healths"], count.index) : false
  }
}
