provider "aws" {
  region = "eu-west-1"
}

module "route53-record" {
  source = "git::https://github.com/clouddrove/terraform-aws-route53-record.git?ref=tags/0.12.1"

  zone_id = "Z1XJD7SSBKXLC1"
  name    = "www"
  type    = "A"
  alias = {
    name                   = "d130easdflja734js.cloudfront.net"
    zone_id                = "Z2FDRFHATA1ER4"
    evaluate_target_health = false
  }
}
