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
  