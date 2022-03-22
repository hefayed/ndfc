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
  vpc110 = {
    fabric_name : "fabric-1"
    switch_name_1 : "Leaf-111"
    switch_name_2 : "Leaf-112"
    name : "vPC110"
    vpc_peer1_id : "110"
    vpc_peer2_id : "110"
    vpc_peer1_access_vlans : "2301"
    vpc_peer2_access_vlans : "2301"
    vpc_peer1_interface : ["e1/10"]
    vpc_peer2_interface : ["e1/10"]
  }
  vpc111 = {
    fabric_name : "fabric-1"
    switch_name_1 : "Leaf-111"
    switch_name_2 : "Leaf-112"
    name : "vPC111"
    vpc_peer1_id : "111"
    vpc_peer2_id : "111"
    vpc_peer1_access_vlans : "2301"
    vpc_peer2_access_vlans : "2301"
    vpc_peer1_interface : ["e1/11"]
    vpc_peer2_interface : ["e1/11"]
  }

  vpc112 = {
    fabric_name : "fabric-1"
    switch_name_1 : "Leaf-111"
    switch_name_2 : "Leaf-112"
    name : "vPC112"
    vpc_peer1_id : "112"
    vpc_peer2_id : "112"
    vpc_peer1_access_vlans : "2301"
    vpc_peer2_access_vlans : "2301"
    vpc_peer1_interface : ["e1/12"]
    vpc_peer2_interface : ["e1/12"]
  }
}
