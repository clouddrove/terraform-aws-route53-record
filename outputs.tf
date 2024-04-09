
output "route53_record_fqdn" {
  description = "FQDN built using the zone domain and name"
  value = {
    default_records = {
      for k, v in aws_route53_record.default : k => v.fqdn
    }
    alias_records = {
      for k, v in aws_route53_record.alias : k => v.fqdn
    }
  }
}


output "route53_record_name" {
  description = "The name of the default record"
  value = {
    default_records = {
      for k, v in aws_route53_record.default : k => v.name
    }
    alias_records = {
      for k, v in aws_route53_record.alias : k => v.name
    }
  }
}
