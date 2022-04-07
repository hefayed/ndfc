

output "msd" {
  value = { for key in data.dcnm_inventory.msd : key.switch_name => key.serial_number }
}
