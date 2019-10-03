provider "aws" {
  region = "eu-west-1"
}

module "route-table" {
  source = "./../../"

  record_enabled = true
  zone_id        = "Z3XYSELRQ8JFS"
  names = [
    "www.",
    "admin."
  ]
  types = [
    "A",
    "CNAME"
  ]
  ttls = [
    "3600",
    "3600",
  ]
  values = [
    "10.0.0.27",
    "mydomain.com",
  ]
}
