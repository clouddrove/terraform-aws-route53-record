locals {
  region      = "us-east-1"
  name        = "cloudfront"
  environment = "test"
}

provider "aws" {
  region = local.region
}

module "acm" {
  source                 = "clouddrove/acm/aws"
  version                = "1.4.1"
  name                   = "${local.name}-certificate"
  environment            = local.environment
  domain_name            = "clouddrove.com"
  validation_method      = "EMAIL"
  validate_certificate   = true
  enable_aws_certificate = true
}

module "cdn" {
  source                 = "clouddrove/cloudfront/aws"
  version                = "1.0.2"
  name                   = "${local.name}-domain"
  environment            = local.environment
  custom_domain          = true
  compress               = false
  aliases                = ["clouddrove.com"]
  domain_name            = "clouddrove.com"
  viewer_protocol_policy = "redirect-to-https"
  allowed_methods        = ["GET", "HEAD"]
  acm_certificate_arn    = module.acm.arn

}

module "records_route53" {
  source = "../"

  #------default records
  enable_default_records = true
  default_records = {
    record1 = {
      records = ["1.2.3.4"]
      ttl     = 300
      zone_id = "Z0xxxxxxxxxxxxxxxxEP"
      name    = "clouddrove.com"
      type    = "A"
    },
    record2 = {
      records = ["5.6.7.8"]
      zone_id = "Z0xxxxxxxxxxxxxxHZ"
      ttl     = 300
      name    = "api.clouddrove.com"
      type    = "A"
    }
  }

  #---- alias records
  enable_alias_records = true
  alias_records = {
    record1 = {
      zone_id = "Z08xxxxxxxxxxxx2HZ"
      name    = "www"
      type    = "A"
      alias = {
        name                   = module.cdn.domain_name
        zone_id                = module.cdn.hosted_zone_id
        evaluate_target_health = true
      }
    },
    record2 = {
      zone_id = "Z01xxxxxxxxxxxxxIEP"
      name    = "www"
      type    = "A"
      alias = {
        name                   = module.cdn.domain_name
        zone_id                = module.cdn.hosted_zone_id
        evaluate_target_health = true
      }
    }
  }
}
