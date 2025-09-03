#TerraformForDevOps 
A Complete Terramform Guide for Developers & DevOps Engineers 

- [Installation Process](installations_process/README.md)
  
- [Core Workflow](managing_containers/README.md)
```bash
  terraform init            # Initialize working directory, download providers & modules.
  terraform validate        # Check config syntax and validity.
  terraform fmt             # Auto-format .tf files.
  terraform plan            # Show execution plan (dry-run).
  terraform apply           # Create or update infrastructure.
  terraform destroy         # Destroy managed infrastructure.
```
 
- [State Management](managing_containers/README.md)
```bash
  terraform state list              # List all resources in state.
  terraform state show <resource>   # Show details of a specific resource.
  terraform state mv <src> <dest>   # Move/rename resource in state file.
  terraform state rm <resource>     # Remove resource from state (infra not deleted).
  terraform state pull              # Download current state from remote backend.
  terraform state push              # Push local state to remote backend.
  terraform state replace-provider <old> <new> # Replace provider references in state.
```

- [Workspace Management](managing_containers/README.md)
```bash
  terraform workspace list          # List all workspaces.
  terraform workspace new <name>    # Create a new workspace.
  terraform workspace select <name> # Switch to a workspace.
  terraform workspace show          # Show the current workspace.
  terraform workspace delete <name> # Delete a workspace.  
```

- [Providers & Modules](managing_containers/README.md)
```bash
  terraform providers               # Show required providers.
  terraform providers mirror <dir>  # Copy provider plugins to local dir.
  terraform providers schema        # Show provider schema (resources & data sources).
  terraform get                     # Download modules.
  terraform init -upgrade           # Upgrade providers and modules.
  terraform providers lock          # Generate .terraform.lock.hcl (dependency lock).
```

- [Outputs & Variables](managing_containers/README.md)
```bash
  terraform output              # Show all outputs.
  terraform output <name>       # Show a specific output.
```  

- [Import & Refresh](managing_containers/README.md)
```bash
  terraform import <resource> <id>  # Import existing infra into Terraform state.
  terraform refresh                 # Sync state with real infra (⚠️ deprecated).
  terraform apply -refresh-only     # Refresh only, without changes.
```

- [Graph & Debugging](managing_containers/README.md)
```bash
  terraform graph               # Generate dependency graph (DOT format).
  terraform version             # Show Terraform version.
  terraform show                # Human-readable output of state or plan.
  terraform show -json          # JSON formatted output of state or plan.
  terraform console             # Interactive console for evaluating expressions.
  TF_LOG=DEBUG terraform apply  # Enable debug logs.
```

- [Login & Cloud](managing_containers/README.md)
```bash
  terraform login                   # Authenticate with Terraform Cloud.
  terraform logout                  # Remove stored Terraform Cloud credentials.
  terraform force-unlock <lock-id>  # Manually unlock state. 
```

- [Providers & Modules](managing_containers/README.md)
```bash
  terraform apply -target=<resource>        # Apply only a specific resource.
  terraform destroy -target=<resource>      # Destroy a specific resource.
  terraform taint <resource>        # Mark resource for recreation (⚠️ deprecated).
  terraform apply -replace=<resource>                 # Replace a specific resource.
  terraform plan -out=<file>        # Save plan to a file.
  terraform apply <file>        # Apply from a saved plan file.
```