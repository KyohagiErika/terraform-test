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
        destination = "deploy.sh"
        permissions = "0700"
    }

    commands = [
        "./deploy.sh && rm ./deploy.sh"
    ]
}

output "deploy_result" {
    value = ssh_resource.deploy.result
}