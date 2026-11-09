# Lab 5.2: AWS Security Services Baseline



Account-level security services that produce evidence continuously.

Run on **Moto** (local AWS emulator), not real AWS.



## Control mapping (NIST 800-53 Rev 5)



| Service | Setting | Controls |

|---|---|---|

| CloudTrail | Multi-region trail, management events | AU-2 / AU-12 |

| CloudTrail | Log-file validation (signed hourly digests) | AU-10 |

| CloudTrail | Log bucket encrypted (AES256) | SC-28 |

| Security Hub | Findings, NIST 800-53 + FSBP standards | RA-5 / SI-4 |

| AWS Config | Not deployed (optional in lab) | CM-2 / CM-6 / CM-8 (gap, see Config.1 finding) |



## What's real vs simulated on Moto



* **Real (Terraform-built):** CloudTrail trail, log bucket, bucket policy, Security Hub enabled.
* **Not supported by Moto:** standards subscriptions (`enable_standards = false` in the gitignored `moto_override.tf`). On real AWS, leave it `true`.
* **Workaround:** Moto lacks `UpdateSecurityHubConfiguration`, so Security Hub was enabled with the CLI and then `terraform import`ed.
* **Simulated:** Moto doesn't generate findings. `evidence/lab-5-2/simulated-findings-input.json` holds 2 sample findings (tagged `cgep:Simulated`), loaded with `batch-import-findings`, then captured in `security-hub-findings.json`.



## Known gap



CloudTrail.2: logs use SSE-S3 (AES256), not a customer-managed KMS key. Fix: add an `aws_kms_key` and set `kms_key_id` on the trail.



## Lessons learned



* A `{` that opens a block must be the last thing on its line.
* Every `{` needs one matching `}`. An error's line number is where the problem starts.
* Lab code can be wrong. `terraform fmt` and `terraform validate` catch it before `apply`.
* Many folders have a `main.tf`, so check the full path before editing.

