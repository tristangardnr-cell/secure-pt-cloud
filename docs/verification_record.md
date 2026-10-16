# Verification record

Date: October 14, 2026 (America/Phoenix). Evidence source: command output run by the project owner in Ubuntu and shared in the project chat. The assistant interpreted those results; it did not independently execute AWS checks. This record summarizes the output and is not a substitute for retained raw evidence.

| Check | Observed result | What it establishes |
|---|---|---|
| terraform plan | No changes; infrastructure matches configuration | No changes proposed by that plan |
| CloudTrail get-trail-status | IsLogging true; successful delivery timestamp; no delivery error shown | Trail reports logging and successful delivery |
| VPC Flow Logs describe | ACTIVE; SUCCESS; no error | Flow log reports active delivery |
| Backend describe-instances | Running; private IP 10.20.10.28; no public IP; expected private subnet; IMDSv2 required | Instance placement and listed metadata settings |
| EBS describe-volumes | Encrypted true; 8 GiB; gp3 | Attached disk encryption flag, size, and type |
| Backend describe-security-groups | Inbound TCP 443/5432 from web SG only; no IPv4/IPv6 CIDR sources; outbound all IPv4 | Listed group rules match the intended inbound design |

CloudTrail latest reported successful delivery: 2026-10-14T17:27:36.774000-07:00. Flow Logs verification did not inspect individual records or generate test traffic. Security group inspection did not independently list every group attached to the instance; Terraform defines only the backend group.

## Evidence still to capture

- AWS Console screenshots of VPC, subnet routes, backend details, EBS encryption, security groups, CloudTrail, and VPC Flow Logs.
- Read-only live private route inspection and confirmation of all instance security groups.
- A sanitized CloudTrail event and a Flow Logs record, where available.
- Any controlled connectivity test must document its source, expected outcome, actual outcome, and cleanup.

Capture only the relevant console panels and review screenshots for account details or unrelated information before publishing. No screenshots or raw command files have been added by this documentation update.

## October 15 console follow-up

The assistant directly inspected the signed-in AWS Console for Phase 5 and saved screenshots. Private routing has one local 10.20.0.0/16 route with the intended subnet association. The instance lists only the private-backend security group. EBS is encrypted with the aws/ebs key alias. Flow Logs are Active; CloudWatch retention is one week and delivered records are present. A sampled recent record reports NODATA, not a tested ACCEPT/REJECT outcome. CloudTrail reports Logging and a latest delivery of October 15, 2026 at 15:28:52 Arizona time. See [Phase 5 summary](phase5_evidence_summary.md). Earlier pending-status statements above describe the October 14 checks.
