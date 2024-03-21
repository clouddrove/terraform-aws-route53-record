provider "aws" {
  region = "us-east-1"
}


module "records_route53" {
  source         = "../.."
  zone_id        = "data.aws_route53_zone.this.zone_id"
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


