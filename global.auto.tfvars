# Cisco DCNM/NDFC user name will be using environment variables

# Inventory list
inventory = {
  fabric-1 = {
    fabric_name : "fabric-1"
    switch_name : ["Leaf-111", "Leaf-112", "BGWS-211", "BGWS-212"]
  }
  fabric-2 = {
    fabric_name : "fabric-2"
    switch_name : ["Leaf-121", "Leaf-122", "BGWS-221", "BGWS-222"]
  }
  shared-border = {
    fabric_name : "shared-border"
    switch_name : ["SB-66", "SB-77"]
  }
}


vpc = {
  vpc15 = {
    policy : "int_vpc_access_host"
    type : "vpc"
    mode : "active"
    bpdu_guard_flag : "true"
    mtu : "jumbo"
    fabric_name : "fabric-1"
    switch_name_1 : "Leaf-111"
    switch_name_2 : "Leaf-112"
    name : "vPC15"
    vpc_peer1_id : "15"
    vpc_peer2_id : "15"
    vpc_peer1_access_vlans : ""
    vpc_peer2_access_vlans : ""
    vpc_peer1_interface : ["e1/5"]
    vpc_peer2_interface : ["e1/5"]
  }
  vpc16 = {
    policy : "int_vpc_access_host"
    type : "vpc"
    mode : "active"
    bpdu_guard_flag : "true"
    mtu : "jumbo"
    fabric_name : "fabric-1"
    switch_name_1 : "Leaf-111"
    switch_name_2 : "Leaf-112"
    name : "vPC16"
    vpc_peer1_id : "16"
    vpc_peer2_id : "16"
    vpc_peer1_access_vlans : ""
    vpc_peer2_access_vlans : ""
    vpc_peer1_interface : ["e1/6"]
    vpc_peer2_interface : ["e1/6"]
  }

  vpc26 = {
    policy : "int_vpc_access_host"
    type : "vpc"
    mode : "active"
    bpdu_guard_flag : "true"
    mtu : "jumbo"
    fabric_name : "fabric-2"
    switch_name_1 : "Leaf-121"
    switch_name_2 : "Leaf-122"
    name : "vPC26"
    vpc_peer1_id : "26"
    vpc_peer2_id : "26"
    vpc_peer1_access_vlans : ""
    vpc_peer2_access_vlans : ""
    vpc_peer1_interface : ["e1/6"]
    vpc_peer2_interface : ["e1/6"]
  }
}

network_30000 = {
  deploy : true
  description : "Created by terraform"
  fabric_name : "Multi-Site"
  ipv4_gateway : "192.168.101.254/24"
  name : "MyNetwork_30000"
  ir_enable_flag : true
  network_id : "30000"
  tag : "12345"
  vlan_id : 2300
  vrf_name : "MyVRF_50000"
}

network_30001 = {
  deploy : true
  description : "Created by terraform"
  fabric_name : "Multi-Site"
  ipv4_gateway : "192.168.102.254/24"
  name : "MyNetwork_30001"
  ir_enable_flag : true
  network_id : "30001"
  tag : "12345"
  vlan_id : 2301
  vrf_name : "MyVRF_50000"
}



MyNetwok_30000 = {
  Leaf-111 : {
    serial_number : "9RM8HCE9ZNM"
    switch_ports : ["Port-channel15"]
  }
  Leaf-112 : {
    serial_number : "90M6EFRMLLG"
    switch_ports : ["Port-channel15"]
  }
}

MyNetwok_30001 = {
  Leaf-111 : {
    serial_number : "9RM8HCE9ZNM"
    switch_ports : ["Port-channel16"]
  }
  Leaf-112 : {
    serial_number : "90M6EFRMLLG"
    switch_ports : ["Port-channel16"]
  }
  Leaf-121 : {
    serial_number : "9W82MY5N0NM"
    switch_ports : ["Port-channel26"]
  }
  Leaf-122 : {
    serial_number : "96M83DT9Z4Q"
    switch_ports : ["Port-channel26"]
  }
}
