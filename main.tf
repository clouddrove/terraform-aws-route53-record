##----------------------------------------------------------------------------------
## Default Records.
##----------------------------------------------------------------------------------

resource "aws_route53_record" "default" {
  for_each = var.enable_default_records ? var.default_records : {}

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
##----------------------------------------------------------------------------------
## Alias Records.
##----------------------------------------------------------------------------------

resource "aws_route53_record" "alias" {
  for_each                         = var.enable_alias_records ? var.alias_records : {}
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





