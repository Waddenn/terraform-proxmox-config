<div align="left" style="position: relative;">
<img src="https://raw.githubusercontent.com/PKief/vscode-material-icon-theme/ec559a9f6bfd399b82bb44393651661b08aaf7ba/icons/folder-markdown-open.svg" align="right" width="30%" style="margin: -20px 0 0 20px;">
<h1>TERRAFORM-PROXMOX-CONFIG</h1>
<p align="left">
	<em>Automate, Deploy, and Manage with Ease!</em>
</p>
<p align="left">
	<img src="https://img.shields.io/github/license/Waddenn/terraform-proxmox-config?style=default&logo=opensourceinitiative&logoColor=white&color=0080ff" alt="license">
	<img src="https://img.shields.io/github/last-commit/Waddenn/terraform-proxmox-config?style=default&logo=git&logoColor=white&color=0080ff" alt="last-commit">
	<img src="https://img.shields.io/github/languages/top/Waddenn/terraform-proxmox-config?style=default&color=0080ff" alt="repo-top-language">
	<img src="https://img.shields.io/github/languages/count/Waddenn/terraform-proxmox-config?style=default&color=0080ff" alt="repo-language-count">
</p>
<p align="left"><!-- default option, no dependency badges. -->
</p>
<p align="left">
	<!-- default option, no dependency badges. -->
</p>
</div>
<br clear="right">

## 🔗 Table of Contents

- [📍 Overview](#-overview)
- [👾 Features](#-features)
- [📁 Project Structure](#-project-structure)
  - [📂 Project Index](#-project-index)
- [🚀 Getting Started](#-getting-started)
  - [☑️ Prerequisites](#-prerequisites)
  - [⚙️ Installation](#-installation)
  - [🤖 Usage](#🤖-usage)
  - [🧪 Testing](#🧪-testing)
- [📌 Project Roadmap](#-project-roadmap)
- [🔰 Contributing](#-contributing)
- [🎗 License](#-license)
- [🙌 Acknowledgments](#-acknowledgments)

---

## 📍 Overview

The terraform-proxmox-config project is a powerful tool for automating the creation and management of Linux Containers (LXC) and virtual machines (VM) in Proxmox environments. It simplifies infrastructure management, providing a secure and efficient way to deploy services like Grafana, Prometheus, GitLab, and NextCloud. Ideal for DevOps engineers and system administrators, it offers flexibility in configuration, streamlining the process of setting up and maintaining complex virtual environments.

---

## 👾 Features

|      | Feature         | Summary       |
| :--- | :---:           | :---          |
| ⚙️  | **Architecture**  | <ul><li>The project uses a modular architecture with separate modules for Linux Containers (`LXC`) and QEMU virtual machines (`VMs`).</li><li>Each module has its own `main.tf`, `variables.tf`, and `providers.tf` files, allowing for independent configuration and management of resources.</li><li>The `main.tf` file at the root level serves as a blueprint for creating and managing multiple `LXC` on Proxmox Virtual Environment.</li></ul> |
| 🔩 | **Code Quality**  | <ul><li>The codebase is written in `Terraform`, a widely-used infrastructure as code (IaC) tool, ensuring readability and maintainability.</li><li>Key configuration parameters are abstracted into `variables.tf` files, promoting code reusability and modularity.</li><li>The project follows best practices for `Terraform` projects, including the use of provider blocks in `providers.tf` files.</li></ul> |
| 📄 | **Documentation** | <ul><li>The project is primarily written in `Terraform`, with a total of 9 `tf` files.</li><li>Each file in the project has a clear purpose, although there is no explicit documentation provided in the form of README or comments in the code.</li><li>The project lacks package manager, container, and command details, indicating a need for improved documentation.</li></ul> |
| 🔌 | **Integrations**  | <ul><li>The project integrates with the Proxmox Virtual Environment through the `Terraform` Proxmox provider.</li><li>The `providers.tf` files in each module specify the Proxmox provider version and source, enabling interaction with the Proxmox infrastructure.</li></ul> |
| 🧩 | **Modularity**    | <ul><li>The project is highly modular, with separate modules for `LXC` and `QEMU VMs`.</li><li>Each module has its own `main.tf`, `variables.tf`, and `providers.tf` files, allowing for independent configuration and management of resources.</li></ul> |
| 🧪 | **Testing**       | <ul><li>There is no explicit mention of testing in the provided context details, indicating a potential area for improvement.</li></ul> |
| ⚡️  | **Performance**   | <ul><li>The project uses `Terraform`, a high-performance IaC tool, to manage and configure resources in the Proxmox Virtual Environment.</li><li>By abstracting configuration parameters into `variables.tf` files, the project allows for efficient and flexible resource management.</li></ul> |
| 🛡️ | **Security**      | <ul><li>The project uses `Terraform` to securely manage resources in the Proxmox Virtual Environment.</li><li>The `variables.tf` file at the root level sets up secure API interaction parameters, including token ID, token secret, and a boolean for TLS security.</li></ul> |

---

## 📁 Project Structure

```sh
└── terraform-proxmox-config/
    ├── main.tf
    ├── modules
    │   ├── lxc
    │   └── qemu
    ├── providers.tf
    └── variables.tf
```


### 📂 Project Index
<details open>
	<summary><b><code>TERRAFORM-PROXMOX-CONFIG/</code></b></summary>
	<details> <!-- __root__ Submodule -->
		<summary><b>__root__</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/Waddenn/terraform-proxmox-config/blob/master/main.tf'>main.tf</a></b></td>
				<td>- The main.tf file in the project serves as a configuration blueprint for creating and managing multiple Linux Containers (LXC) on Proxmox Virtual Environment<br>- It specifies the parameters for each container, including VM ID, target node, storage, OS template, and network settings<br>- This setup enables the deployment of various services like Grafana, Prometheus, GitLab, and NextCloud among others.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/Waddenn/terraform-proxmox-config/blob/master/variables.tf'>variables.tf</a></b></td>
				<td>- Variables.tf establishes key configuration parameters for the project's API interaction<br>- It sets the API URL, token ID, token secret, and a boolean for TLS security<br>- These variables are crucial for the project's ability to securely and effectively communicate with the specified API.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/Waddenn/terraform-proxmox-config/blob/master/providers.tf'>providers.tf</a></b></td>
				<td>- Providers.tf establishes the necessary Terraform provider for the Proxmox virtual environment platform<br>- It specifies the Proxmox version and source, and sets up the API connection parameters<br>- This file plays a crucial role in the codebase architecture by enabling interaction with the Proxmox infrastructure.</td>
			</tr>
			</table>
		</blockquote>
	</details>
	<details> <!-- modules Submodule -->
		<summary><b>modules</b></summary>
		<blockquote>
			<details>
				<summary><b>lxc</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/Waddenn/terraform-proxmox-config/blob/master/modules/lxc/main.tf'>main.tf</a></b></td>
						<td>- The 'modules/lxc/main.tf' file in the project structure is responsible for creating and configuring Linux containers in Proxmox environments<br>- It sets up container attributes such as hostname, cores, memory, network settings, and more, based on the provided variables<br>- This contributes to the overall project's infrastructure management and automation.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/Waddenn/terraform-proxmox-config/blob/master/modules/lxc/variables.tf'>variables.tf</a></b></td>
						<td>- The 'variables.tf' in the 'lxc' module defines the configuration parameters for creating Linux containers<br>- It specifies attributes such as the container's ID, hostname, target node, operating system template, CPU cores, memory, and network settings<br>- It also allows for optional customization of these parameters, providing flexibility in the container creation process.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/Waddenn/terraform-proxmox-config/blob/master/modules/lxc/providers.tf'>providers.tf</a></b></td>
						<td>- The 'providers.tf' within the 'lxc' module specifies the required providers for the Terraform project<br>- It particularly mandates the use of the Proxmox provider from Telmate, version "3.0.1-rc6"<br>- This is integral to the codebase architecture as it sets the foundation for infrastructure management.</td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>qemu</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/Waddenn/terraform-proxmox-config/blob/master/modules/qemu/main.tf'>main.tf</a></b></td>
						<td>- The 'modules/qemu/main.tf' file in the project structure is responsible for defining the configuration of a virtual machine (VM) in Proxmox using the Terraform QEMU provider<br>- It sets up VM attributes such as name, ID, core, memory, network, and disk specifications, and also manages VM cloning.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/Waddenn/terraform-proxmox-config/blob/master/modules/qemu/variables.tf'>variables.tf</a></b></td>
						<td>- The 'variables.tf' within the 'qemu' module defines the configuration parameters for creating a virtual machine (VM) in Proxmox<br>- It includes specifications for VM name, ID, target node, CPU cores and sockets, memory, BIOS type, boot settings, QEMU agent activation, network settings, and disk storage details.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/Waddenn/terraform-proxmox-config/blob/master/modules/qemu/providers.tf'>providers.tf</a></b></td>
						<td>- Providers.tf within the qemu module establishes the necessary provider for the Terraform project<br>- It specifies the Proxmox provider, sourced from Telmate, and sets the version to "3.0.1-rc6"<br>- This is crucial for managing resources within the Proxmox virtualization environment, contributing to the overall codebase architecture.</td>
					</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
</details>

---
## 🚀 Getting Started

### ☑️ Prerequisites

Before getting started with terraform-proxmox-config, ensure your runtime environment meets the following requirements:

- **Programming Language:** Terraform


### ⚙️ Installation

Install terraform-proxmox-config using one of the following methods:

**Build from source:**

1. Clone the terraform-proxmox-config repository:
```sh
❯ git clone https://github.com/Waddenn/terraform-proxmox-config
```

2. Navigate to the project directory:
```sh
❯ cd terraform-proxmox-config
```

3. Install the project dependencies:

echo 'INSERT-INSTALL-COMMAND-HERE'



### 🤖 Usage
Run terraform-proxmox-config using the following command:
echo 'INSERT-RUN-COMMAND-HERE'

### 🧪 Testing
Run the test suite using the following command:
echo 'INSERT-TEST-COMMAND-HERE'

---
## 📌 Project Roadmap

- [X] **`Task 1`**: <strike>Implement feature one.</strike>
- [ ] **`Task 2`**: Implement feature two.
- [ ] **`Task 3`**: Implement feature three.

---

## 🔰 Contributing

- **💬 [Join the Discussions](https://github.com/Waddenn/terraform-proxmox-config/discussions)**: Share your insights, provide feedback, or ask questions.
- **🐛 [Report Issues](https://github.com/Waddenn/terraform-proxmox-config/issues)**: Submit bugs found or log feature requests for the `terraform-proxmox-config` project.
- **💡 [Submit Pull Requests](https://github.com/Waddenn/terraform-proxmox-config/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your github account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone https://github.com/Waddenn/terraform-proxmox-config
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to github**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="left">
   <a href="https://github.com{/Waddenn/terraform-proxmox-config/}graphs/contributors">
      <img src="https://contrib.rocks/image?repo=Waddenn/terraform-proxmox-config">
   </a>
</p>
</details>

---

## 🎗 License

This project is protected under the [SELECT-A-LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

## 🙌 Acknowledgments

- List any resources, contributors, inspiration, etc. here.

---
