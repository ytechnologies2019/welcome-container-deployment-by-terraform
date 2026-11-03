Container Deployment using Terraform (For Learning Purposes Only)

Welcome to the Terraform Container Deployment hands-on lab. This project is designed to help you learn core and intermediate Terraform concepts by deploying Docker containers across multiple environments.

Prerequisites

Before you begin, ensure you have the following installed on your machine:

Docker Engine: Installed and running.

Terraform CLI: Installed (version 1.0.0+ recommended).

Key Learning Concepts Covered

This repository demonstrates the following Terraform concepts:

Variables (variables.tf): Defining and using input variables for modular configuration.

Locals (locals.tf): Using local values to simplify expressions and avoid repetition.

Workspaces (terraform workspace): Managing multi-environment state (dev vs. prod).

Provisioners (local-exec): Executing local commands on the machine running Terraform.

Persistent Data & Bind Mounts: Mounting volumes to ensure container data persistence.

Random Provider (random_string): Generating unique resource naming and dynamic identifiers.

Loops & Splat Expressions: Using for loops and [*] splat expressions to iterate over infrastructure resources.

Dynamic Ports: Exposing and mapping port lists dynamically.

Graphing (terraform graph): Visualizing resource dependencies.

Step-by-Step Execution Guide

1. Initialize the Configuration

Initialize the working directory to download necessary provider plugins (e.g., Docker, Random).

terraform init


2. Set Up Workspaces

Create and manage environments using Terraform workspaces (dev and prod).

# Create and switch to the 'dev' workspace
terraform workspace new dev

# Create and switch to the 'prod' workspace
terraform workspace new prod

# Select an existing workspace
terraform workspace select dev

# List all available workspaces
terraform workspace list


3. Deploy the Infrastructure

To deploy the containers using your defined variables and workspaces:

# Preview the deployment changes
terraform plan

# Apply the configuration and deploy containers
terraform apply -auto-approve


Advanced Operations & Inspection

Visualizing Resource Dependency Graphs

Generate a visual graph of your Terraform resources and dependencies:

# Output DOT format string
terraform graph

# Render graph as an image (requires Graphviz installed)
terraform graph | dot -Tpng > graph.png


Cleanup

To destroy the resources created by Terraform in the current workspace:

terraform destroy -auto-approve


Project Structure

.
├── main.tf        # Main infrastructure configuration (Docker provider, resources)
├── variables.tf   # Input variable declarations
├── outputs.tf     # Output definitions using splat expressions
├── locals.tf      # Local values calculation based on active workspace
└── README.md      # Project documentation
