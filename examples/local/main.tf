variable "port" {
  type    = number
  default = 2222
}

variable "grid_port" {
  type    = number
  default = 4444
}

variable "browsers" {
  type    = list(string)
  default = ["chromium"]
}

module "selenium" {
  source = "../.."

  hosts                = { box = "127.0.0.1" }
  ssh_port             = var.port
  ssh_private_key_file = "./id_ed25519"
  ssh_known_hosts_file = "./known_hosts"

  browsers = var.browsers
  port     = var.grid_port
}

output "grid_url" {
  value = module.selenium.grid_url
}
