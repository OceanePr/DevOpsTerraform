terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_network" "app_network" {
  name = "app_network"
}

resource "docker_image" "nginx" {
  name = "nginx:1.27"
}

resource "docker_image" "php" {
  name = "php:7.4-fpm"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial-nginx"

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = "C:\\Users\\ocean\\docker\\IaC\\etape1\\app\\nginx.conf"
    container_path = "/etc/nginx/conf.d/default.conf"
  }
}

resource "docker_container" "php_fpm" {
  image = docker_image.php.image_id
  name  = "php_server"

  networks_advanced {
    name = docker_network.app_network.name
  }

  volumes {
    host_path      = "C:\\Users\\ocean\\docker\\IaC\\etape1\\app"
    container_path = "/app"
  }
}
