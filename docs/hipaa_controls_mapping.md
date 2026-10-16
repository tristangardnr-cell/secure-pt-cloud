# HIPAA-aligned safeguards mapping

Prepared October 15, 2026 for the SecurePT Cloud portfolio lab. This is an educational mapping of observed infrastructure controls to relevant safeguards, not a finding that a clinic or this lab complies with HIPAA. The mapping covers the selected topics below, not every requirement. No clinical application or real-patient workflow is demonstrated.

## How to read the status

**Partial support** means a lab feature supports a safeguard objective while important implementation or operational evidence is missing. **Not demonstrated** means the available code and evidence do not establish that capability. Neither status is a compliance determination. Regulatory relationships below are the project author's analysis of the cited sources.

## Technical safeguards

| Safeguard and reference | Lab status | Evidence | Boundary and next evidence needed |
|---|---|---|---|
| Access control, 164.312(a)(1) [T] | Partial support | [Backend sources](../screenshots/09-backend-inbound-sources.jpg), [private routes](../screenshots/04-private-routes.jpg) | Network access is restricted to defined sources/ports. There is no patient application authorization or staff access matrix. |
| Unique user identification, 164.312(a)(2)(i) [T] | Not demonstrated | No application identity evidence | Establish named accounts, roles, access review, and a demonstration of attributable activity. A source security group is not a user identity. |
| Emergency access, 164.312(a)(2)(ii) [T] | Not demonstrated | No emergency access procedure | Define and exercise an authorized emergency-access process. |
| Automatic logoff, 164.312(a)(2)(iii) [T] | Not demonstrated | No application sessions | Define inactivity handling and verify application session termination. |
| Encryption/decryption, 164.312(a)(2)(iv) [T] | Partial support | [Encrypted EBS and aws/ebs alias](../screenshots/10-ebs-encryption.jpg); ec2.tf | At-rest volume encryption is verified. Data handling, key access, snapshots, endpoints, and other storage paths have not been assessed as a complete system. |
| Audit controls, 164.312(b) [T] | Partial support | [CloudTrail](../screenshots/12-cloudtrail-logging.jpg), [Flow Logs](../screenshots/11-vpc-flow-log.jpg) | Infrastructure/API and network visibility exist. Patient-record access auditing and a routine review process are not demonstrated. |
| Integrity, 164.312(c)(1)-(2) [T] | Not demonstrated for application data | S3 versioning is configured in cloudtrail.tf | Versioning alone does not establish clinical-record integrity, immutable logging, or recovery. Add integrity and restore tests for the intended application/data. |
| Person/entity authentication, 164.312(d) [T] | Not demonstrated for clinical access | IMDSv2 is required on EC2 | IMDSv2 protects metadata access; it is not patient/staff authentication. Establish and test application and administrator identities. |
| Transmission security, 164.312(e)(1)-(2) [T] | Not demonstrated | TCP 443 is permitted in main.tf | A permitted port does not establish TLS. No listener, certificate validation, or protected application transaction has been tested. |

## Administrative and physical safeguards

| Safeguard and reference | Lab status | Current contribution | Work still needed |
|---|---|---|---|
| Risk analysis, 164.308(a)(1)(ii)(A) [A][R] | Not demonstrated as a practice-wide assessment | Architecture and gaps are recorded | Inventory all actual ePHI flows, threats, vulnerabilities, likelihood, impact, owners, and corrective actions. The lab gap list is not a completed risk analysis. |
| Risk management, 164.308(a)(1)(ii)(B) [A] | Partial support | Segmentation, private placement, encryption | Tie selected safeguards to documented risks and treatment decisions. |
| Activity review, 164.308(a)(1)(ii)(D) [A] | Partial support | Logging status and a delivered Flow Logs record inspected | Assign review responsibility and retain review/investigation evidence. A NODATA record does not show a blocked attack. |
| Workforce/access management, 164.308(a)(3)-(4) [A] | Not demonstrated | Network boundaries exist | Document roles, onboarding, access approval, review, and offboarding for the actual practice. |
| Awareness/training, 164.308(a)(5) [A] | Not demonstrated | Project learning notes | Establish workforce training and supporting records; project notes are not workforce training evidence. |
| Incident procedures, 164.308(a)(6) [A] | Not demonstrated as an operational process | CloudTrail and Flow Logs can support investigation | Define reporting, triage, escalation, response, and documentation; conduct a controlled exercise. |
| Contingency planning, 164.308(a)(7) [A] | Not demonstrated | No backup automation or restore test in the project | Define backup, recovery, and emergency operations for actual workloads; test recovery. An encrypted root disk is not a backup. |
| Evaluation, 164.308(a)(8) [A] | Partial support | Dated read-only configuration checks and screenshots | Add ongoing technical/nontechnical evaluation and application-level tests. |
| Business associate arrangements, 164.308(b) [A] | Not assessed | No signed agreements reviewed | Review relevant vendors, responsibilities, and required arrangements before a real deployment involving ePHI. |
| Physical safeguards, 164.310 [P] | Not assessed | Cloud network evidence only | Assess practice facilities, workstations, devices, media, and applicable provider responsibilities. A private subnet is not a physical safeguard. |
| Policies/documentation, 164.316 [D] | Partial support | Versioned project notes, architecture, mapping, screenshots | Establish approved operational policies, owners, availability, review, and applicable retention. A portfolio README is not a complete policy program. |

## Interpretation notes

Addressable implementation specifications require a reasoned assessment and documentation; the designation is not a blanket permission to ignore them. [H]

The six-year provision in 164.316(b)(2)(i) concerns the documentation specified by that section. It should not be presented as a universal six-year retention rule for every technical log. The seven-day CloudWatch retention is a lab cost-control choice; a practice needs an appropriate documented logging/retention decision. [D]

## Evidence scope

Phase 5 captures show public/private route associations, the private local-only route, the backend's no-public-IP setting and sole listed security group, IMDSv2, EBS encryption, CloudTrail Logging with delivery time, and the active Flow Logs destination and retention. S3 encryption, versioning, and public-access blocking were reviewed in Terraform; those bucket settings were not separately screenshot-verified. Log file validation is disabled and trail SSE-KMS is not enabled. No application data access or connectivity tests were performed.

## Sources

Checked October 15, 2026. The eCFR pages displayed Title 45 current through October 14, 2026; proposed changes are not treated here as effective requirements.

[T]: https://www.ecfr.gov/current/title-45/subtitle-A/subchapter-C/part-164/subpart-C/section-164.312
[A]: https://www.ecfr.gov/current/title-45/subtitle-A/subchapter-C/part-164/subpart-C/section-164.308
[P]: https://www.ecfr.gov/current/title-45/subtitle-A/subchapter-C/part-164/subpart-C/section-164.310
[D]: https://www.ecfr.gov/current/title-45/subtitle-A/subchapter-C/part-164/subpart-C/section-164.316
[H]: https://www.hhs.gov/hipaa/for-professionals/security/laws-regulations/index.html
[R]: https://www.hhs.gov/hipaa/for-professionals/security/guidance/guidance-risk-analysis/index.html

- [T] Technical safeguards, 45 CFR 164.312.
- [A] Administrative safeguards, 45 CFR 164.308.
- [P] Physical safeguards, 45 CFR 164.310.
- [D] Policies and documentation, 45 CFR 164.316.
- [H] HHS Security Rule summary and required/addressable explanation.
- [R] HHS risk analysis guidance.
