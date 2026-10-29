package compliance.sc28_test

import rego.v1
import data.compliance.sc28

with_cmek := {"planned_values":{"root_module":{"resources":[{
  "address":"google_storage_bucket.good", "type":"google_storage_bucket",
  "values":{"encryption":[{"default_kms_key_name":"projects/x/locations/us/keyRings/r/cryptoKeys/k"}]}}]}}}

no_cmek := {"planned_values":{"root_module":{"resources":[{
  "address":"google_storage_bucket.bad", "type":"google_storage_bucket",
  "values":{"encryption":[]}}]}}}

test_cmek_passes if {
  d := sc28.deny with input as with_cmek
  count(d) == 0
}

test_no_cmek_fails if {
  d := sc28.deny with input as no_cmek
  count(d) == 1
}
