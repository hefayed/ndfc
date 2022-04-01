
variable "policy" {
  type = string
}

variable "type" {
  type = string
}
variable "fabric_name" {
  type = string
}

variable "name" {
}
variable "switch_name_1" {
  type = string
}
variable "switch_name_2" {
  type = string
}
variable "mode" {
  type = string
}
variable "bpdu_guard_flag" {
  type = string
}
variable "mtu" {
  type = string
}
variable "vpc_peer1_access_vlans" {
  type = string
}
variable "vpc_peer2_access_vlans" {
  type = string
}
variable "vpc_peer1_id" {
  type = string
}
variable "vpc_peer2_id" {
  type = string
}
variable "vpc_peer1_interface" {
  type = list(string)
}
variable "vpc_peer2_interface" {
  type = list(string)
}


