package compliance.ac3_test

import rego.v1
import data.compliance.ac3

locked := {"planned_values":{"root_module":{"resources":[{
  "address":"google_storage_bucket.good", "type":"google_storage_bucket",
  "values":{"uniform_bucket_level_access":true,"public_access_prevention":"enforced"}}]}}}

public := {"planned_values":{"root_module":{"resources":[{
  "address":"google_storage_bucket.bad", "type":"google_storage_bucket",
  "values":{"uniform_bucket_level_access":false,"public_access_prevention":"inherited"}}]}}}

open_ssh := {"planned_values":{"root_module":{"resources":[{
  "address":"google_compute_firewall.ssh", "type":"google_compute_firewall",
  "values":{"direction":"INGRESS","source_ranges":["0.0.0.0/0"],"allow":[{"protocol":"tcp","ports":["22"]}]}}]}}}

test_locked_bucket_passes if {
  d := ac3.deny with input as locked
  count(d) == 0
}

test_public_bucket_fails if {
  d := ac3.deny with input as public
  count(d) == 1
}

test_open_ssh_fails if {
  d := ac3.deny with input as open_ssh
  count(d) == 1
}
