# Phase 2 Deployment Summary — Private Backend Server

## Deployment Status

Phase 2 deployed successfully with Terraform.

Terraform result:

```text
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

## Resource Added

A private EC2 instance was deployed to represent a protected healthcare backend system, such as an internal application server or patient database placeholder.

```text
private_backend_instance_id = "i-0563dc160aae125f9"
```

## Security Configuration

The private backend EC2 instance was configured with the following controls:

- deployed inside the private subnet
- no public IP address
- attached only to the private backend security group
- encrypted root EBS volume
- small Free Tier eligible instance type: `t3.micro`
- IMDSv2 required for instance metadata access
- tagged for project, environment, sensitivity, and role

## Why t3.micro Was Used

The initial Terraform configuration used `t2.micro`, but AWS rejected the deployment because `t2.micro` was not Free Tier eligible for this AWS account.

AWS returned an error indicating that the selected instance type was not eligible for Free Tier.

AWS listed `t3.micro` as Free Tier eligible, so the Terraform variable was updated from:

```text
t2.micro
```

to:

```text
t3.micro
```

`t3.micro` is a newer burstable EC2 instance type and is appropriate for this lab because it is low-cost, lightweight, and compatible with the selected Ubuntu x86_64 AMI.

## Architecture After Phase 2

```text
SecurePT Cloud VPC
├── Public subnet
│   └── public web security group
└── Private subnet
    └── private EC2 backend server
        ├── no public IP
        ├── encrypted root volume
        └── private backend security group
```

## Security Reasoning

The private backend server is intentionally not internet-facing. This models a secure healthcare architecture where sensitive backend systems are isolated from direct public access.

The backend can only receive traffic allowed by its security group. In this lab, the private backend security group permits selected internal traffic from the public web security group, not from the open internet.

This supports the following security principles:

- least privilege
- network segmentation
- reduced public attack surface
- protection of systems that may handle PHI/ePHI
- encrypted storage for sensitive backend systems
- Infrastructure as Code repeatability

## Interview Talking Point

"In Phase 2, I added a private EC2 backend server using Terraform. The instance is deployed into a private subnet with no public IP address, attached to a restrictive security group, and uses encrypted root storage. This models how a healthcare backend or patient database layer should be isolated from direct internet exposure."

## Next Phase

Phase 3 should add stronger observability and compliance documentation, such as:

- CloudTrail for API activity logging
- VPC Flow Logs for network visibility
- CloudWatch log group with retention
- HIPAA-aligned control mapping
- screenshots from AWS Console showing VPC, subnets, security groups, and EC2 placement
