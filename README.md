# Terraform Proxmox Config

Configuration Terraform modulaire pour gérer les containers LXC sur un cluster Proxmox.

## 🏗 Architecture

Le projet est organisé pour séparer les responsabilités :

- **Modules** : Logique de création des ressources (`modules/lxc`)
- **Containers** : Définitions séparées par domaine :
  - `infrastructure.tf` : Services core (DNS, Monitoring, VPN)
  - `applications.tf` : Applications Web et outils
  - `media.tf` : Services multimédia
  - `development.tf` : Environnements de test et build
- **Locals** : Configuration partagée (`locals.tf`) incluant les profiles de taille et les tags.

## 🌐 Réseau

L'infrastructure utilise une segmentation par VLANs :

| ID | Nom | Usage | Gateway |
|----|-----|-------|---------|
| 1 | vmbr0 | Management / Default | 192.168.1.1 |
| 20 | vPROD | Infrastructure / App | 192.168.20.254 |
| 30 | vSEC | Security (Vaultwarden) | 192.168.30.254 |
| 40 | vDMZ | Exposed Services | 192.168.40.254 |

## 🚀 Usage

### Prérequis
1. Créer un fichier `terraform.tfvars` avec vos secrets :
   ```hcl
   pm_api_url          = "https://192.168.1.1:8006/api2/json"
   pm_api_token_secret = "votre-token-secret"
   ssh_public_key      = "ssh-ed25519 ..."
   ```

2. Initialiser Terraform :
   ```bash
   terraform init
   ```

3. Vérifier le plan :
   ```bash
   terraform plan
   ```

4. Appliquer :
   ```bash
   terraform apply
   ```

## 📦 Profiles

Des profiles de taille sont disponibles dans `locals.tf` pour standardiser les ressources :

- **Small** : 2 Cores / 2GB RAM / 16GB Disk
- **Medium** : 4 Cores / 4GB RAM / 32GB Disk
- **Large** : 6 Cores / 6GB RAM / 40GB Disk
- **XL** : 12 Cores / 20GB RAM / 100GB Disk
