terraform {
  required_providers {
    dcnm = {
      source = "CiscoDevNet/dcnm"
    }
  }
}

resource "dcnm_network" "MyNetwork" {
  deploy         = var.deploy
  description    = var.description
  fabric_name    = var.fabric_name
  ipv4_gateway   = var.ipv4_gateway
  name           = var.name
  ir_enable_flag = var.ir_enable_flag
  network_id     = var.network_id
  tag            = var.tag
  vlan_id        = var.vlan_id
  vrf_name       = var.vrf_name
  dynamic "attachments" {
    for_each = [for key in var.switch_list : key]
    content {
      serial_number = attachments.value
      attach        = true
      switch_ports  = var.switch_ports
    }
  }
}
