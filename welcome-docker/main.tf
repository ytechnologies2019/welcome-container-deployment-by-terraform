#Random String terraform
resource "random_string" "random" {
  count   = var.container_count
  length  = 3
  special = false
  upper   = false
}

# Image according to the environment 
locals {
  image          = terraform.workspace == "prod" ? var.prod_container_image : var.stg_container_image
  container_port = terraform.workspace == "prod" ? var.prod_ext_port : var.stg_ext_port
}

# Find the latest Welcome Docker Container precise image.
resource "docker_image" "welcome-docker" {
  name = local.image
}
# Start a container
resource "docker_container" "welcome-container" {
  count = var.container_count
  name  = join("-", ["welcome-docker", terraform.workspace ,random_string.random[count.index].id])
  image = docker_image.welcome-docker.image_id
  volumes {
    container_path = "/usr/share/nginx/html/"
    host_path      = "/data/container-data/"
  }

  ports {
    internal = var.int_port
    external = local.container_port[count.index]
  }
}

resource "null_resource" "update_website" {
  provisioner "local-exec" {
    command = "echo 'Web Container V1' > /data/container-data/index.html"
  }
}