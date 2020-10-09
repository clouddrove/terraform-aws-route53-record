provider "aws" {
  region = "eu-west-1"
}

module "route53-record" {
  source = "git::https://github.com/clouddrove/terraform-aws-route53-record.git?ref=tags/0.13.0"

  zone_id = "Z1XJD7SSBKXLC1"
  name    = "www"
  type    = "A"
  ttl     = "3600"
  values  = "10.0.0.27"
}
