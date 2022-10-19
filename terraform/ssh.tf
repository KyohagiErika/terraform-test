provider "ssh" {
    
}

resource "ssh_resource" "deploy" {
    host = var.SSH_HOST_NAME
    port = var.SSH_PORT
    user = var.SSH_USERNAME
    private_key = var.SSH_PRIVATE_KEY

    when = "create"

    commands = [
        "rm terraform-test",
        "git clone https://github.com/KyohagiErika/terraform-test.git",
        "cd terraform-test",
        "docker compose down",
        "docker compose build",
        "docker compose up -d"
    ]
}

output "deploy_output" {
    value = try(jsondecode(ssh_resource.deploy.result), {})
}