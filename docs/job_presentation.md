# SecurePT - job presentation materials

Drafts prepared October 15, 2026; repository link added October 16. These describe a portfolio lab, not employment or production clinical operations. The public repository and published files were verified on October 16, 2026. No post or application has been submitted.

## Resume project entry

**SecurePT Cloud Security Lab | AWS, Terraform, Linux, Git**

- Built a segmented AWS VPC with public/private subnets, explicit routing, and backend security-group rules using Terraform.
- Deployed a private Ubuntu EC2 demonstration server with no public IP, required IMDSv2, and encrypted EBS storage.
- Configured CloudTrail audit logging and VPC Flow Logs delivery to CloudWatch; verified deployed settings and captured console evidence.
- Documented architecture, address-plan tradeoffs, selected HIPAA safeguard relationships, and gaps in application/operational coverage.

## LinkedIn project description

SecurePT Cloud is my healthcare-focused AWS security infrastructure lab, modeled around a small physical therapy practice. I used Terraform to build public/private subnet segmentation, restricted backend access, encrypted storage, and infrastructure logging. The repository includes an architecture diagram, 14 console screenshots, verification notes, and a referenced safeguards mapping that identifies what the lab demonstrates and what still needs work.

Repository: https://github.com/tristangardnr-cell/secure-pt-cloud

## LinkedIn completion post draft

I completed the infrastructure and documentation stages of SecurePT Cloud Security Lab, a healthcare-focused AWS/Terraform portfolio project.

The lab includes a segmented VPC, a private Ubuntu backend without a public IP, encrypted EBS, IMDSv2, CloudTrail, and VPC Flow Logs. I captured deployment evidence and documented the limits alongside the controls.

One useful lesson: a security-group rule allowing TCP 443 does not by itself prove TLS, application authentication, or a working patient portal. Those require their own implementation and tests.

I am continuing to practice troubleshooting, Linux, PowerShell, and explaining the architecture.

Repository: https://github.com/tristangardnr-cell/secure-pt-cloud

## 60-second walkthrough

1. State the problem: protect a healthcare-style backend from direct public exposure and provide infrastructure visibility.
2. Show the diagram: /16 VPC parent pool; two /24 subnets; public gateway route and private local-only route.
3. Show backend evidence: no public IP, IMDSv2 Required, encrypted EBS, limited source-group rules.
4. Explain logs: CloudTrail for AWS API activity; Flow Logs for network metadata.
5. State the limits: no installed clinical application/database service, no connection test, backups/restore test or automated response.
6. Describe the next improvement: a controlled connectivity demonstration with synthetic data, or a documented management and patching path.
