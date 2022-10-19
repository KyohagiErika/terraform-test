terraform {
    cloud {
        organization = "longle_organization"

        workspaces {
        name = "test-cli"
        }
    }

    required_providers {
        ssh = {
            source = "loafoe/ssh"
            version = "2.2.1"
        }
    }
}