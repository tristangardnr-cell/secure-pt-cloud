# Phase 3 Deployment Summary — CloudTrail Audit Logging

## Deployment Status

Phase 3 deployed successfully with Terraform.

Terraform result:

```text
Apply complete! Resources: 7 added, 0 changed, 0 destroyed.
```

## Resources Added

Phase 3 added AWS audit logging using CloudTrail and S3.

Terraform outputs:

```text
cloudtrail_name = "secure-pt-cloud-trail"
cloudtrail_s3_bucket = "secure-pt-cloud-cloudtrail-logs-69f9fdb4"
```

Resources added include:

- random suffix for globally unique S3 bucket naming
- S3 bucket for CloudTrail audit logs
- S3 public access block
- S3 bucket versioning
- S3 server-side encryption
- S3 bucket policy allowing CloudTrail to write logs
- CloudTrail trail

## Security Purpose

CloudTrail provides an audit trail for AWS account/API activity.

It helps answer questions such as:

- Who launched an EC2 instance?
- Who changed a security group?
- Who created or deleted cloud resources?
- When did the action happen?
- Which AWS identity performed the action?

## Healthcare / Compliance Relevance

For healthcare security, audit logging is important because systems that may handle PHI/ePHI need accountability and traceability.

CloudTrail does not enforce access control by itself. Instead:

- IAM/RBAC controls define what users are allowed to do.
- CloudTrail records what users actually did.

This supports investigation, accountability, and audit readiness.

## Security Configuration

The CloudTrail log bucket includes:

- blocked public access
- server-side encryption
- bucket versioning
- restricted bucket policy allowing CloudTrail log delivery

## Interview Talking Point

"I added CloudTrail audit logging to capture AWS API activity and security-relevant infrastructure changes. Logs are stored in a dedicated S3 bucket with public access blocked, encryption enabled, and versioning turned on. This creates an audit trail for cloud activity, which is important in healthcare and compliance-focused environments."

## Next Phase

Phase 4 should add network visibility with VPC Flow Logs or move into documentation/screenshots depending on project deadline.
