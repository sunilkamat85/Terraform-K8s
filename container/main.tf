resource "docker_container" "nodered_container" {
  name  = var.name_in
  image = var.image_in
  ports {
    internal = var.int_port_in
    external = var.ext_port_in
  }
  
  volumes {
    container_path = var.container_path_in
    volume_name = docker_volume.container_volume.name
  }
   provisioner "local-exec" {
    when = create
    command = "echo ${self.name}: ${self.ip_address}:${join("", [for x in self.ports[*]["external"]: x])} >> ${path.cwd}/mikeperry"
    on_failure = fail
  }
}

resource "docker_volume" "container_volume" {
  name = "${var.name_in}-volume"
  lifecycle {
    prevent_destroy = false
  }
  provisioner "local-exec" {
    when = destroy
    command = "mkdir ${path.cwd}/../backup/"
    on_failure = continue 
  }
  provisioner "local-exec" {
    when = destroy
    command = "sudo tar -czvf ${path.cwd}/../backup/${self.name}.tar.gz ${self.mountpoint}/"
    on_failure = fail
  }

}