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

module "inventory" {
  source          = "./modules/inventory"
  for_each        = var.inventory
  fabric_name     = each.value.fabric_name
  fabric_switches = each.value.switch_name
}


# output "fabric-1-switches_serial_number" {
#   value = lookup({ for key, value in module.inventory["fabric-1"].msd : key => value }, "Leaf-112")
# }

module "vpc_interface" {
  source                 = "./modules/vpc_interface"
  for_each               = var.vpc
  policy                 = each.value.policy
  type                   = each.value.type
  fabric_name            = each.value.fabric_name
  name                   = each.value.name
  switch_name_1          = each.value.switch_name_1
  switch_name_2          = each.value.switch_name_2
  mode                   = each.value.mode
  bpdu_guard_flag        = each.value.bpdu_guard_flag
  mtu                    = each.value.mtu
  vpc_peer1_access_vlans = each.value.vpc_peer1_access_vlans
  vpc_peer2_access_vlans = each.value.vpc_peer2_access_vlans
  vpc_peer1_id           = each.value.vpc_peer1_id
  vpc_peer2_id           = each.value.vpc_peer2_id
  vpc_peer1_interface    = each.value.vpc_peer1_interface
  vpc_peer2_interface    = each.value.vpc_peer2_interface
}

resource "dcnm_network" "MyNetwork_30000" {
  deploy         = true
  description    = "Created by terraform"
  fabric_name    = "Multi-Site"
  ipv4_gateway   = "192.168.101.254/24"
  name           = "MyNetwork_30000"
  ir_enable_flag = true
  network_id     = "30000"
  tag            = "12345"
  vlan_id        = 2300
  vrf_name       = "MyVRF_50000"
  dynamic "attachments" {
    for_each = [for index, value in var.MyNetwok_30000 : value]
    content {
      serial_number = attachments.value.serial_number
      attach        = true
      switch_ports  = attachments.value.switch_ports
    }
  }
}


resource "dcnm_network" "MyNetwork_30001" {
  deploy         = true
  description    = "Created by terraform"
  fabric_name    = "Multi-Site"
  ipv4_gateway   = "192.168.102.254/24"
  name           = "MyNetwork_30001"
  ir_enable_flag = true
  network_id     = "30001"
  tag            = "12345"
  vlan_id        = 2301
  vrf_name       = "MyVRF_50000"
  dynamic "attachments" {
    for_each = [for index, value in var.MyNetwok_30001 : value]
    content {
      serial_number = attachments.value.serial_number
      attach        = true
      switch_ports  = attachments.value.switch_ports
    }
  }
}
