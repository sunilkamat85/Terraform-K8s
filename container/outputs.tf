# output "IP-Address" {
#   value = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address], i.ports[*]["external"])]
#   description = "IP address of the container"
# }

# output "Container-Name" {
#   value = docker_container.nodered_container.name
#   description = "Name of the container"
# }