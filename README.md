# Global Automated Mesh Application
### End-to-End GitOps Infrastructure & Orchestration Pipeline

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/ansible-%23EE0000.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

## 📄 Documentation
[Download the Technical PDF Summary](./Nathaniel-Edet-Global-Mesh-README.pdf)

## 🌟 Project Overview
This project serves as a comprehensive demonstration of modern Cloud Engineering practices. It automates the entire lifecycle of a containerized application—starting from a blank AWS account to a fully functional Kubernetes-orchestrated environment.

## 🛠️ Key Engineering Features
* **Declarative Infrastructure:** Entire AWS networking stack (VPC, IGW, Subnets) and compute (EC2) managed via Terraform.
* **Dynamic Pipeline Integration:** Bridges the gap between Terraform and Ansible by dynamically passing ephemeral Public IPs via GitHub Action environment variables.
* **Lightweight Orchestration:** Utilizes K3s (Kubernetes) to manage container lifecycles on resource-constrained instances.
* **Automated Security:** Programmatic management of Security Groups and SSH key-pair injection.

## 🚀 How It Works
1.  **Provisioning:** Terraform initializes the AWS resources and outputs the instance metadata.
2.  **Synchronization:** GitHub Actions captures the `public_ip` and prepares the Ansible environment.
3.  **Configuration:** Ansible installs Docker, K3s, and configures the host OS.
4.  **Orchestration:** The final step deploys an Nginx mesh pod and exposes it via a NodePort service.

## 📁 Repository Structure
* `/terraform`: HCL files for AWS infrastructure.
* `/ansible`: Playbooks and inventory templates.
* `/.github/workflows`: CI/CD pipeline definitions.

## 👤 Author
**Nathaniel Edet** *Cloud & DevOps Engineer*

---
*This is a personal project showcasing automation proficiency and infrastructure-as-code best practices.*
