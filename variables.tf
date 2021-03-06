
variable "inventory" {
  type = map(object({
    fabric_name : string
    switch_name : list(string)
  }))
}

variable "username" {
  type      = string
  sensitive = true
}

variable "password" {
  type      = string
  sensitive = true
}

variable "url" {
  type = string
}
variable "vpc" {
  type = map(object({
    policy                 = string
    type                   = string
    mode                   = string
    bpdu_guard_flag        = string
    mtu                    = string
    name                   = string
    switch_name_1          = string
    switch_name_2          = string
    fabric_name            = string
    vpc_peer1_id           = string
    vpc_peer2_id           = string
    vpc_peer1_access_vlans = string
    vpc_peer2_access_vlans = string
    vpc_peer1_interface    = list(string)
    vpc_peer2_interface    = list(string)
  }))
}

variable "MyNetwok_30000" {
  type = map(object({
    serial_number = string
    switch_ports : list(string)
  }))
}

variable "MyNetwok_30001" {
  type = map(object({
    serial_number = string
    switch_ports : list(string)
  }))
}

variable "network_30000" {
  type = map(any)
}

variable "network_30001" {
  type = map(any)
}




