# Security controls and limitations

This document explains implemented lab controls and evidence. A [referenced HIPAA safeguards mapping](hipaa_controls_mapping.md) records partial support and missing capabilities using official sources. This document makes no compliance determination.

| Security objective | Implementation | Evidence and limits |
|---|---|---|
| Separate public and backend systems | Separate subnets and route tables | Terraform reviewed; private subnet placement and local-only route verified in the console |
| Restrict backend inbound access | TCP 443/5432 from web SG only | Rule output verified; no application connectivity test |
| Reduce public exposure | Backend has no public IP | Instance output verified |
| Protect stored backend data | Encrypted EBS root volume | Encryption flag and aws/ebs alias verified; key policy not assessed |
| Require metadata tokens | IMDSv2 required | Instance output verified |
| Record AWS API activity | CloudTrail to S3 | Logging/delivery status verified; sample event review pending |
| Protect audit storage | S3 public access block, AES256 encryption, versioning | Terraform reviewed; no claim of immutable storage |
| Provide network visibility | VPC Flow Logs to CloudWatch | ACTIVE/SUCCESS verified; recent delivered NODATA record inspected; no connection test |
| Limit log storage duration in lab | Seven-day CloudWatch retention | Terraform reviewed; not a production retention policy |
| Repeatable infrastructure | Terraform and Git | Original deployment summaries and commit history recovered |

## Gaps and future work

- No clinical application, database service, or public web server is installed by this Terraform. TCP 443 alone does not establish application TLS.
- No tested backup/restore process, defined recovery objectives, or high availability is demonstrated.
- No incident response automation or alerting resources are present. Logging is distinct from response.
- CloudTrail is single-region. Log file integrity validation, organization-wide coverage, and application-level audit records are not established by this configuration.
- Flow Logs delivery IAM policy currently uses Resource "*"; narrowing permissions is a future hardening item.
- Both security groups permit all outbound IPv4 traffic. Private routing currently constrains reachability in the Terraform design; egress policy refinement is future work.
- Secure administration, patching, application identity, production key management, and operational monitoring need explicit designs and verification.
- Access reviews, workforce procedures, risk assessment, contractual requirements, and other organizational safeguards are outside the evidence collected here.

## Interview boundaries

Describe the backend as a demonstration server, storage as verified encrypted, and logging as reporting successful delivery. Avoid claiming tested traffic blocking, a functional patient database, immutable audit logs, complete incident response, or HIPAA compliance from these checks.
