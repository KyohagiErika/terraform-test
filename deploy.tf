resource "ssh_resource" "deploy" {
    when = "create"

    host = "10.204.5.109"
    port = "22"
    user = "longthanhle1122"
    agent = true
    private_key = "~/.ssh/id_rsa"
    host_private_key = "./host_private_key"

    command = [
        "echo hello world!"
    ]
}