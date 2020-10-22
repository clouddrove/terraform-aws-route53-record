provider "aws" {
  region = "eu-west-1"
}

module "route53-record" {
  source  = "./../../"
  zone_id = "Z1XJD7SSBKXLC1"
  name    = "www"
  type    = "A"
  ttl     = "3600"
  values  = "10.0.0.27"
}
