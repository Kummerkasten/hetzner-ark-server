### Server creation with one linked primary ip (ipv4)
resource "hcloud_primary_ip" "primary_ip_1" {
name          = "primary_ip_test"
datacenter    = "nbg1-dc3"
type          = "ipv4"
assignee_type = "server"
auto_delete   = true
  labels = {
    "service" : "ark"
  }
}

# Create a new SSH key
resource "hcloud_ssh_key" "ssh" {
  name       = "Terraform"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "hcloud_server" "sark" {
  name        = "ark-server"
  image       = "ubuntu-24.04"
  server_type = "cx42"
  datacenter  = "nbg1-dc3"
  labels = {
    "service" : "ark"
  }
  ssh_keys = [hcloud_ssh_key.ssh.id]
  public_net {
    ipv4_enabled = true
    ipv4 = hcloud_primary_ip.primary_ip_1.id
    ipv6_enabled = false
  }
  user_data = file("user_data.yaml")
}