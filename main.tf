## Managed By : CloudDrove
## Copyright @ CloudDrove. All Right Reserved.

# Module      : Route53 Record Set
# Description : Terraform module to create Route53 record sets resource on AWS.
# resource "aws_route53_record" "default" {
#   count                            = var.record_enabled && length(var.alias) == 0 ? 1 : 0
#   zone_id                          = var.zone_id
#   name                             = var.name
#   type                             = var.type
#   ttl                              = var.ttl
#   records                          = split(",", var.values)
#   set_identifier                   = var.set_identifier
#   health_check_id                  = var.health_check_id
#   multivalue_answer_routing_policy = var.multivalue_answer_routing_policy
#   allow_overwrite                  = var.allow_overwrite
# }

resource "aws_route53_record" "default" {
  for_each = var.record_default_enabled ? var.default_records : {}

  zone_id                          = each.value.zone_id
  name                             = each.value.name
  type                             = each.value.type
  ttl                              = each.value.ttl
  records                          = each.value.records
  set_identifier                   = var.set_identifier
  health_check_id                  = var.health_check_id
  multivalue_answer_routing_policy = var.multivalue_answer_routing_policy
  allow_overwrite                  = var.allow_overwrite
}

# Module      : Route53 Record Set
# Description : Terraform module to create Route53 record sets resource on AWS.

resource "aws_route53_record" "alias" {
  for_each                         = var.record_alias_enabled ? var.records : {}
  zone_id                          = each.value.zone_id
  name                             = each.value.name
  type                             = each.value.type
  set_identifier                   = var.set_identifier
  health_check_id                  = var.health_check_id
  multivalue_answer_routing_policy = var.multivalue_answer_routing_policy
  allow_overwrite                  = var.allow_overwrite
  alias {
    name                   = each.value.alias.name
    zone_id                = each.value.alias.zone_id
    evaluate_target_health = each.value.alias.evaluate_target_health
  }
}





