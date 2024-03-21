provider "aws" {
  region = "us-east-1"
}


module "route53_record" {
  source         = "../.."
  zone_id        = "Z1XJD7SSBKXLC1"
  record_enabled = false
  records = {
    record1 = {
      name = "www"
      type = "A"
      alias = {
        name                   = "d130easdflja734js.cloudfront.net"
        zone_id                = "Z2FDRFHATA1ER4"
        evaluate_target_health = false
      }
    },
    record2 = {
      name = "www"
      type = "A"
      alias = {
        name                   = "d130easdflja734js.cloudfront.net"
        zone_id                = "Z2FDRFHATA1ER4"
        evaluate_target_health = false
      }
    }
  }
}