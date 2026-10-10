# SecurePT Cloud Security Lab

## Project Overview

SecurePT Cloud Security Lab is a healthcare-focused AWS security portfolio project modeled around the needs of a small physical therapy practice.

The goal is to build a HIPAA-aligned cloud security architecture that demonstrates practical skills in cloud networking, infrastructure as code, encryption, access control, monitoring, and incident response planning.

This project is not presented as a fully production-ready HIPAA implementation by itself. It is a technical portfolio lab and business blueprint showing the safeguards, documentation, and architecture needed for a secure healthcare environment.

## Why This Project Matters

Small healthcare practices often need secure systems for patient intake, documentation, billing, scheduling, backups, and administrative workflows. These environments require strong privacy and security controls because they may handle protected health information (PHI/ePHI).

This project demonstrates how a secure foundation can be designed using AWS and Terraform.

## Skills Demonstrated

- AWS cloud networking
- VPC design
- public and private subnet segmentation
- routing and internet gateway configuration
- security groups / cloud firewall rules
- Terraform Infrastructure as Code
- encryption planning with AWS KMS
- least privilege design
- healthcare security thinking
- HIPAA-aligned technical safeguards
- documentation for employers and clients

## Planned Architecture

The first version of this lab will include:

- One AWS VPC named `secure-pt-cloud`
- One public subnet for DMZ-style public-facing systems
- One private subnet for sensitive backend systems
- Internet gateway for public subnet internet access
- Route tables separating public and private traffic
- Security groups enforcing least privilege
- Later phase: private EC2 instance representing a patient database server
- Later phase: encrypted storage using AWS KMS
- Later phase: logging/monitoring with CloudWatch or Wazuh

## Project Phases

### Phase 1 — Network Foundation

Build the AWS VPC, public subnet, private subnet, route tables, internet gateway, and initial security groups using Terraform.

### Phase 2 — Secure Private Server

Deploy a private EC2 instance representing a backend patient database system. Configure encrypted storage and strict security group access.

### Phase 3 — Monitoring and Logging

Add centralized logging and monitoring. Initial MVP may use AWS-native logging. Later versions may integrate Wazuh SIEM.

### Phase 4 — Incident Response Automation

Build a safe lab demo where suspicious activity triggers an automated response, such as blocking an IP address in a security group.

### Phase 5 — HIPAA-Aligned Documentation

Map the technical controls to HIPAA-aligned safeguards and create documentation useful for employers, clients, and future Savvy Security Solutions offerings.

## Repository Structure

```text
secure-pt-cloud/
├── README.md
├── terraform/
├── docs/
├── diagrams/
├── screenshots/
└── scripts/
```

## Status

Current status: Project skeleton created. Terraform Phase 1 will be built next.

## Business Connection

This project supports the future development of Savvy Security Solutions, a planned cybersecurity and managed security services business focused on practical security for small healthcare and local businesses.
