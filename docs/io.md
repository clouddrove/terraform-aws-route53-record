## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alias | An alias block. Conflicts with ttl & records. Alias record documented below. | `map(any)` | `{}` | no |
| allow\_overwrite | Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments. | `bool` | `false` | no |
| health\_check\_id | The health check the record should be associated with. | `string` | `""` | no |
| multivalue\_answer\_routing\_policy | Set to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy. | `any` | `null` | no |
| name | The name of the record. | `string` | `""` | no |
| record\_enabled | Whether to create Route53 record set. | `bool` | `true` | no |
| set\_identifier | Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies documented below. | `string` | `null` | no |
| ttl | (Required for non-alias records) The TTL of the record. | `string` | `""` | no |
| type | The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT. | `string` | `""` | no |
| values | (Required for non-alias records) A string list of records. To specify a single record value longer than 255 characters such as a TXT record for DKIM, add "" inside the Terraform configuration string (e.g. "first255characters""morecharacters"). | `string` | `""` | no |
| zone\_id | Zone ID. | `string` | n/a | yes |

## Outputs

No output.

