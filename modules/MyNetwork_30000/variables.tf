variable "switch_list" {
  type = list(string)
}

variable "deploy" {
  type = bool
}
variable "description" {
  type = string
}
variable "fabric_name" {
  type = string
}
variable "ipv4_gateway" {
  type = string
}
variable "name" {
  type = string
}
variable "ir_enable_flag" {
  type = bool
}
variable "network_id" {
  type = string
}
variable "tag" {
  type = string
}
variable "vlan_id" {
  type = number
}
variable "vrf_name" {
  type = string
}

# variable "serial_number" {
#   type = string
# }

variable "switch_ports" {
  type = list(string)
}
