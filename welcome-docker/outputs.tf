
#Container Info
output "container_info" {
  description = "Container Info"
  value       = [for i in docker_container.welcome-container[*] : join(" -> ", [i.name, join(":", [i.network_data[0].ip_address], [i.ports[0].external])])]
}
