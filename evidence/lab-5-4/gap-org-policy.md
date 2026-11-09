\# Gap: Org Policy constraints not enforced (Lab 5.4)



Date: 2026-11-09

Controls affected: AC-3, AC-6, IA-5, IA-2, AC-17



\## What was planned

3 org policies in terraform/baselines/gcp/org\_policy.tf:

\- storage.uniformBucketLevelAccess: \_AC-3, AC-6\_

\- iam.disableServiceAccountKeyCreation: \_\_IA-5\_

\- compute.requireOsLogin: \_\_IA-2, AC-17



\## Why it was not applied

Project cgep-lab-12345 has no Organization (see no-organization.txt).

orgpolicy.policies.create returned 403.The Org Policy Administrator role can only be granted at the Organization level, so even the project Owner cannot set these policies.



\## Risk

\_\_\_\_



\## Compensating controls

\- WIF used for CI, so no service account keys are needed (wif-provider.txt)

\- Data Access audit logs on for IAM, KMS and Storage (audit-configs.txt)



\## Plan

Set enable\_org\_policies = true once the project sits under an Organization (Capstone).

