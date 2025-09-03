# Terraform Installation Process

 

---

## Table of Contents

* [Terraform Installation](#terraform-installation)

  * [Linux (Debian/Ubuntu)](#linux-debianubuntu)
  * [Linux (RHEL/CentOS/Fedora)](#linux-rhelcentosfedora)
  * [Windows (PowerShell)](#windows-powershell)

    * [Option 1: Chocolatey](#option-1-chocolatey)
    * [Option 2: Scoop](#option-2-scoop)
  * [macOS (Homebrew)](#macos-homebrew)
  * [Manual Installation (All Platforms)](#manual-installation-all-platforms)
* [Verify Installation](#verify-installation)
* [Terraform Command Cheat Sheet](#terraform-command-cheat-sheet)

---

## Terraform Installation

### Linux (Debian/Ubuntu)

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install terraform -y
```

### Linux (RHEL/CentOS/Fedora)

```bash
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```

### Windows (PowerShell)

#### Option 1: Chocolatey

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
 [System.Net.ServicePointManager]::SecurityProtocol = `
 [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
 iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install terraform -y
```

#### Option 2: Scoop

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop install terraform
```

### macOS (Homebrew)

```bash
brew update
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

### Manual Installation (All Platforms)

1. Download the latest Terraform binary from [Terraform Downloads](https://developer.hashicorp.com/terraform/downloads).
2. Extract the ZIP file:

   * Linux/macOS: `unzip terraform_<version>_<os>_<arch>.zip`
   * Windows: Extract using File Explorer.
3. Move binary to PATH:

   * Linux/macOS: `sudo mv terraform /usr/local/bin/`
   * Windows: Add folder to **Environment Variables → Path**.

---

## Verify Installation

```bash
terraform -version
```

Expected output:

```
Terraform v1.x.x
```

---
 
## References

* [Terraform Official Docs](https://developer.hashicorp.com/terraform/docs)
* [Terraform Downloads](https://developer.hashicorp.com/terraform/downloads)
