# SecurePT Cloud — Milestones

## Deadline Goal
Complete a job-ready SecurePT Cloud MVP by next Friday.

## MVP Definition
The MVP should be strong enough to show employers and future clients:

- AWS network segmentation
- Terraform Infrastructure as Code
- cloud firewall/security group design
- HIPAA-aligned security reasoning
- screenshots proving deployment
- clean README and documentation

## Phase 1 — Project Skeleton

- [x] Create project folder
- [x] Create README
- [x] Create folders: terraform, docs, diagrams, screenshots, scripts
- [x] Initialize Git
- [ ] First commit

## Phase 2 — AWS Access

- [ ] Configure AWS CLI credentials
- [ ] Confirm identity with `aws sts get-caller-identity`
- [ ] Set default AWS region

## Phase 3 — Terraform Network Foundation

- [ ] Create Terraform versions file
- [ ] Create provider configuration
- [ ] Create VPC
- [ ] Create public subnet
- [ ] Create private subnet
- [ ] Create internet gateway
- [ ] Create public route table
- [ ] Create security groups
- [ ] Run `terraform fmt`
- [ ] Run `terraform init`
- [ ] Run `terraform validate`
- [ ] Run `terraform plan`
- [ ] Apply after review

## Phase 4 — Secure Backend Layer

- [ ] Add private EC2 instance placeholder
- [ ] Add encrypted EBS volume
- [ ] Add KMS encryption
- [ ] Restrict access with security groups

## Phase 5 — Documentation Package

- [ ] Architecture diagram
- [ ] Screenshots
- [ ] HIPAA-aligned controls mapping
- [ ] Interview talking points
- [ ] Savvy Security Solutions connection page

## Phase 6 — Backup and Publish

- [ ] Push to GitHub
- [ ] Create milestone zip backup
- [ ] Copy backup to Google Drive / OneDrive
