terraform {
  required_providers {
    dcnm = {
      source = "CiscoDevNet/dcnm"
    }
  }
}
resource "dcnm_interface" "vpc" {
  policy                 = var.policy
  type                   = var.type
  fabric_name            = var.fabric_name
  name                   = var.name
  switch_name_1          = var.switch_name_1
  switch_name_2          = var.switch_name_2
  mode                   = var.mode
  bpdu_guard_flag        = var.bpdu_guard_flag
  mtu                    = var.mtu
  vpc_peer1_access_vlans = var.vpc_peer1_access_vlans
  vpc_peer2_access_vlans = var.vpc_peer2_access_vlans
  vpc_peer1_id           = var.vpc_peer1_id
  vpc_peer2_id           = var.vpc_peer2_id
  vpc_peer1_interface    = var.vpc_peer1_interface
  vpc_peer2_interface    = var.vpc_peer2_interface
}
