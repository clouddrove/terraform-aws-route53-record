provider "aws" {
  region = "eu-west-1"
}

module "route-table" {
  source = "git::https://github.com/clouddrove/terraform-aws-route-table.git?ref=tags/0.12.0"

  zone_id = "Z2FDRFHATA1ER4"

  names = [
    "www.",
    "admin."
  ]
  types = [
    "A",
    "CNAME"
  ]
  alias = {
    names = [
      "d130easdflja734js.cloudfront.net"
    ]
    zone_ids = [
      "Z2FDRFHATA1ER4"
    ]
    evaluate_target_healths = [
      false
    ]
  }
}
