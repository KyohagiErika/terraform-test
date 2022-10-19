provider "ssh" {
    
}

resource "ssh_resource" "deploy" {
    host = var.SSH_HOST_NAME
    port = var.SSH_PORT
    user = var.SSH_USERNAME
    private_key = var.SSH_PRIVATE_KEY

    when = "create"

    file {
        content = file("deploy.sh")
        destination = "/tmp/deploy.sh"
        permissions = "7"
    }

    commands = [
        "/tmp/deploy.sh",
        "rm -rfd /tmp"
    ]
}

output "deploy_output" {
    value = ssh_resource.deploy.result
}