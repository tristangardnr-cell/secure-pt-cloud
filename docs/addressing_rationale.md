# Address-plan explanation

## The choice made in this lab

The VPC address pool is 10.20.0.0/16, covering 10.20.0.0 through 10.20.255.255. The first 16 bits are fixed; the remaining 16 bits can vary. That produces 65,536 addresses in the pool. This is capacity, not the number of servers deployed.

The public subnet is 10.20.1.0/24 and the private subnet is 10.20.10.0/24. Each /24 fixes the first 24 bits and contains 256 addresses. AWS reserves five per subnet, leaving 251 assignable addresses in each of these subnets.

```text
10.20.0.0/16       VPC parent address pool
├── 10.20.1.0/24   Public subnet
├── 10.20.10.0/24  Private backend subnet
└── Other space   Unallocated; no resources created by reserving it
```

## Why /16 here?

The deployed configuration uses a generous parent pool that leaves room for multiple /24 subnets, future availability zones, or management/monitoring tiers. A /16 can be partitioned into 256 non-overlapping /24 blocks. The project currently uses two of them. This is a retrospective design explanation, not a recovered record of the original author's exact sizing decision.

A /16 is not required by AWS, HIPAA, cloud architecture, or the size of a PT clinic. It does not itself improve security. A smaller pool could support this lab. The tradeoff is simple expansion space versus reserving more private address space and increasing potential overlap with future connected networks.

## Could the VPC be /24 instead?

Yes, with a different subnet plan. For example, 10.20.0.0/24 could contain 10.20.0.0/25 and 10.20.0.128/25. Those have 128 total addresses and 123 assignable AWS addresses each. The current two /24 subnets cannot both fit inside a single /24 VPC.

Even the existing subnet ranges could fit within 10.20.0.0/20 (10.20.0.0 through 10.20.15.255); /16 is therefore generous rather than necessary. These are explanatory alternatives, not proposed deployment changes. AWS does not support resizing an existing VPC CIDR in place; changing the primary plan would need deliberate migration/rebuild planning.

## Classful addressing versus CIDR

10.x.x.x was historically Class A. The explicit /16 here is CIDR; it does not turn the address into Class B. A /24 can be an entire allocation or a subnet within a larger pool. Prefix length determines block size, while its role depends on the design.

For the physical office, actual device counts, VLAN roles, growth, VPN ranges, and routing rules should drive the plan. An AWS subnet is not a physical-office VLAN; the cloud and office networks can use different, non-overlapping address plans.

## Interview explanation

"I allocated a /16 parent range to the VPC and carved out separate /24 public and private subnets. That leaves growth space without deploying thousands of hosts. A smaller VPC could support this lab; security comes from routing and access controls, not from the size of the CIDR block."

## Sources

- [AWS VPC CIDR rules](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-cidr-blocks.html).
- [AWS subnet sizing and reserved addresses](https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html).
