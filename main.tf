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
  deploy         = var.network_30000.deploy
  description    = var.network_30000.description
  fabric_name    = var.network_30000.fabric_name
  ipv4_gateway   = var.network_30000.ipv4_gateway
  name           = var.network_30000.name
  ir_enable_flag = var.network_30000.ir_enable_flag
  network_id     = var.network_30000.network_id
  tag            = var.network_30000.tag
  vlan_id        = var.network_30000.vlan_id
  vrf_name       = var.network_30000.vrf_name
  dynamic "attachments" {
    for_each = [for index, value in var.MyNetwok_30000 : value]
    content {
      serial_number = attachments.value.serial_number
      attach        = true
      switch_ports  = attachments.value.switch_ports
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}


resource "dcnm_network" "MyNetwork_30001" {
  deploy         = var.network_30001.deploy
  description    = var.network_30001.description
  fabric_name    = var.network_30001.fabric_name
  ipv4_gateway   = var.network_30001.ipv4_gateway
  name           = var.network_30001.name
  ir_enable_flag = var.network_30001.ir_enable_flag
  network_id     = var.network_30001.network_id
  tag            = var.network_30001.tag
  vlan_id        = var.network_30001.vlan_id
  vrf_name       = var.network_30001.vrf_name
  dynamic "attachments" {
    for_each = [for index, value in var.MyNetwok_30001 : value]
    content {
      serial_number = attachments.value.serial_number
      attach        = true
      switch_ports  = attachments.value.switch_ports
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}
