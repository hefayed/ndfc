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
