# Phase 1 Deployment Summary — AWS Network Foundation

## Deployment Status

Phase 1 deployed successfully with Terraform.

Terraform result:

```text
Apply complete! Resources: 10 added, 0 changed, 0 destroyed.
```

## AWS Resources Created

The Phase 1 Terraform deployment created the foundational AWS network for SecurePT Cloud:

1. VPC
2. Internet Gateway
3. Public subnet
4. Private subnet
5. Public route table
6. Public route table association
7. Private route table
8. Private route table association
9. Public web security group
10. Private backend security group

## Terraform Outputs

```text
vpc_id = "vpc-0e9a72b02df3d627e"
public_subnet_id = "subnet-064dc33ef6694a42a"
private_subnet_id = "subnet-06330515f1e0d06b4"
public_web_security_group_id = "sg-08827c8a1bc329176"
private_backend_security_group_id = "sg-0b72d9edc13b39d88"
```

## Architecture Explanation

The SecurePT Cloud VPC models a small healthcare cloud network.

- The **public subnet** represents a DMZ/front-end network tier for systems that may need controlled internet exposure.
- The **private subnet** represents a protected backend tier for sensitive systems such as patient database servers or internal applications.
- The **internet gateway** is attached to the VPC, but only the public route table sends internet-bound traffic to it.
- The **private route table** does not currently include a default internet route, reducing exposure for backend systems.
- The **public web security group** allows HTTP/HTTPS traffic from the internet for demo front-end systems.
- The **private backend security group** allows only internal traffic from the public web security group, not direct internet access.

## Security Reasoning

This architecture demonstrates several security principles:

- network segmentation
- least privilege
- reduced attack surface
- separation of public and private workloads
- healthcare-oriented protection for systems that may handle PHI/ePHI
- repeatable Infrastructure as Code deployment

## Interview Talking Point

"I used Terraform to deploy a segmented AWS VPC for a healthcare security lab. The architecture separates internet-facing systems from private backend systems using public/private subnets, route tables, and security groups. This models a HIPAA-aligned approach where sensitive systems are not directly exposed to the internet."

## Next Phase

Phase 2 will add a private backend EC2 instance with encrypted storage to represent a protected healthcare application or patient database server.
