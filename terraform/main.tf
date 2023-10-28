terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "token" {
  type        = string
}

variable "ssh" {
  type        = string
}



provider "digitalocean" {
  token = var.token
}

resource "digitalocean_droplet" "docker_droplet" {
  name   = "docker-droplet"
  region = "nyc1" # Change to your desired region
  size   = "s-4vcpu-8gb" # Change to your desired Droplet size

  image = "docker-18-04" # Use a Docker-enabled image

  ssh_keys = [
    var.ssh, # Replace with your SSH key's fingerprint
  ]

  connection {
    host = self.ipv4_address
    type        = "ssh"
    user        = "root"
    private_key = file("~/.ssh/foodics_rsa") # Path to your SSH private key
    timeout = "2m"  
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "git clone https://github.com/ralqunaibit/foodics-interview.git",
      "cd foodics-interview",
      "docker-compose up -d"
    ]
  }  
}

output "docker_droplet_ip" {
  value = digitalocean_droplet.docker_droplet.ipv4_address
}
