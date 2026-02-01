output "container_ips" {
  description = "Map of container names to their IP addresses"
  value = {
    for k, v in module.lxc_containers.containers : k => try(v.network[0].ip, "dhcp")
  }
}

output "containers_by_node" {
  description = "List of containers grouped by target node"
  value = {
    for k, v in module.lxc_containers.containers : k => v.target_node
  }
}
