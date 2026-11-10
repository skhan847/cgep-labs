Portfolio submission checklist:



oscal/components/<your-component>.json validated by trestle.

oscal/profiles/cge-p-minimum.json validated.

evidence/lab-6-1/trestle-validate.txt captured.

A README in oscal/ saying which module each component describes and where its evidence lives.


1. compliant-s3.json documents how the compliant-s3 module meets SC-28 (encryption at rest with a customer-managed KMS key).

2. AC-3 and CM-6 are enforced by the compliant-s3 module and the Lab 3.4 policies; AU-3 is covered by the module’s access logging. None of the three are written up in OSCAL yet.

3. evidence/lab-4-4/: proof for SC-28. receipt.json is the signed evidence receipt from grc-gate run #15, verify.txt shows the chain-of-custody check passed (CHAIN INTACT), and chain-intact.png is the screenshot of the green run.
evidence/lab-6-1/trestle-validate.txt: shows both OSCAL files passed trestle validate.

4. Gap: the lab expects the evidence link to point at a signed object in the S3 evidence vault. The vault ran on Moto inside GitHub Actions and was deleted when the run ended, so the component definition links to evidence/lab-4-4 on GitHub instead.