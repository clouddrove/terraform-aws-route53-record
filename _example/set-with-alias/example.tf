
locals {
  region = "us-east-1"
}

provider "aws" {
  region = local.region
}


module "records_route53" {
  source = "../.."
  #------default records
  record_default_enabled = false

  default_records = {
    record1 = {
      records = ["1.2.3.4"]
      ttl     = 300
      zone_id = "Z0xxxxxxxxxxxxxxxxEP"
      name    = "clouddrove.ca"
      type    = "A"
    },
    record2 = {
      records = ["5.6.7.8"]
      zone_id = "Z0xxxxxxxxxxxxxxHZ"
      ttl     = 300
      name    = "api.clouddrove.ca"
      type    = "A"
    }
  }
  #---- alias records
  record_alias_enabled = false

  alias_records = {
    record1 = {
      zone_id = "Z0xxxxxxxxxxxxxxxxEP"
      name    = "www"
      type    = "A"
      alias = {
        name                   = d130easdflja734js.cloudfront.net
        zone_id                = "Z2FDRFHATA1ER4"
        evaluate_target_health = true
      }
    },
    record2 = {
      zone_id = "Z0xxxxxxxxxxxxxxxxHZ"
      name    = "www"
      type    = "A"
      alias = {
        name                   = d130easdflja734js.cloudfront.net
        zone_id                = "Z2FDRFHATA1ER4"
        evaluate_target_health = true
      }
    }
  }
}
