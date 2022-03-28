#configure provider with your Cisco DCNM/NDFC credentials.
terraform {
  required_providers {
    dcnm = {
      source  = "CiscoDevNet/dcnm"
      version = "1.2.0"
    }
  }
}

provider "dcnm" {
  # Cisco DCNM/NDFC user name
  username = var.username
  # Cisco DCNM/NDFC password
  password = var.password
  # Cisco DCNM/NDFC url
  url      = var.url
  insecure = true
  platform = "nd"
}

module "fabric_switches" {
  source          = "./modules/ndfc_inventory"
  for_each        = var.inventory
  fabric_name     = each.value.fabric_name
  fabric_switches = each.value.switch_name
}


resource "dcnm_interface" "vpc" {
  for_each               = var.vpc
  policy                 = "int_vpc_access_host"
  type                   = "vpc"
  fabric_name            = each.value.fabric_name
  name                   = each.value.name
  switch_name_1          = each.value.switch_name_1
  switch_name_2          = each.value.switch_name_2
  mode                   = "active"
  bpdu_guard_flag        = "true"
  mtu                    = "jumbo"
  vpc_peer1_access_vlans = each.value.vpc_peer1_access_vlans
  vpc_peer2_access_vlans = each.value.vpc_peer2_access_vlans
  vpc_peer1_id           = each.value.vpc_peer1_id
  vpc_peer2_id           = each.value.vpc_peer2_id
  vpc_peer1_interface    = each.value.vpc_peer1_interface
  vpc_peer2_interface    = each.value.vpc_peer2_interface
}


data "dcnm_interface" "vpc" {
  for_each      = var.vpc
  serial_number = dcnm_interface.vpc[each.key].serial_number
  name          = each.value.name
  type          = "vpc"
  fabric_name   = "fabric-1"
}

output "vpc" {
  value = [for key in data.dcnm_interface.vpc : key.id]
} 




/* resource "dcnm_network" "MyNetwork_30003" {
  deploy         = false
  description    = "Created by terraform"
  fabric_name    = "Multi-Site"
  ipv4_gateway   = "192.168.103.254/24"
  name           = "MyNetwork_30003"
  ir_enable_flag = true
  network_id     = "30003"
  tag            = "12345"
  vlan_id        = 2303
  vrf_name       = "MyVRF_50000"
} */

/* data "dcnm_network" "check" {
  fabric_name = "Multi-Site"
  name        = "MyNetwork_30000"
}

output "MyNetwork_30000" {
  value = data.dcnm_network.check
}
