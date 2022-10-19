provider "ssh" {
    
}

resource "ssh_resource" "deploy" {
    host = var.SSH_HOST_NAME
    port = var.SSH_PORT
    user = var.SSH_USERNAME
    private_key = var.SSH_PRIVATE_KEY

    when = "create"

    file {
        content = [
            "cd terraform-test",
            "git pull",
            "docker compose down",
            "docker compose build",
            "docker compose up -d"
        ]
        destination = "/tmp/deploy.sh"
    }

    commands = [
        "/tmp/deploy.sh",
        "rm -rfd /tmp"
    ]
}

output "deploy_output" {
    value = try(jsondecode(ssh_resource.deploy.result), {})
}