/*
 * Around AWS Key-Pair
 *
 * Refs:
 *   - http://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/ec2-key-pairs.html
 */

resource "aws_key_pair" "sonic883b" {
  key_name = "sonic883b"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBPDEKZ7OLlmGMLhjatvEEUf9csALi/BYRS7zwn0j2r4rI3mONaSfi4944WQ+uV5AQaMS+us3l45cma4XvitJAIJu3c8NuC/g9e9ul0kpm7dMSrH/pq+AKBQvWsPOx+eOAPjBDUKnbxxAN8ws+jlOLwfUiKtYoe1vFpFSk/BUh1uMYorNjkK5+rlLVs66LOAxrRe4XR9NbANn21phs2YvMeJgIGSO2eHYO3dr4Bkg5ZI/4oOEcP2assVAHftolsPkmEKGuyZJzm3/hZfTZJPAcZjBIPw8GPgrfAo74Xrq91UZSeldtI53DQaB38ROFQ3an7OtwzIdpNl0blyP23shj sonic883b"
}

resource "aws_key_pair" "dac_naka" {
  key_name = "dac_naka"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVAvbbPrF9kM1tXWTaqsmbuz+G1C48hsWiSHRV+K7lWsLsu7LFMhR5CdXDU6eMB54U0+cu42RRGz5AOWlLOIJB/QHLwnS8hVFDnWoq4p2AWWX3tdtkSsck2zlmL8H39oTnp+OtfuH8vsVPvwphs1flptIb+NPhHKqyMdglsZDrG++gavXMy5gjLD/HG9b5ApkIUEhDnls3H2m3DgISPv4OWB9yNGzPs2dsY+DGkzpuCKlEeHCdmbeB256brDpKSPP6vqqJn/T9QJeJ5e7wJwPIRGeEPYz/K8QV6TjE/KQI1OxOsIMdVM8YOONsh3SpwzqxrKBwXY19NuvMYUYIwtFf yosuke-nakanishi@dac.co.jp"

}

output "key_pair_sonic883b" {
  value = "${aws_key_pair.sonic883b.key_name}"

}
