# Global Automated Mesh Application Part 2
### End-to-End GitOps Infrastructure & Orchestration Pipeline

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/ansible-%23EE0000.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

## 📄 Documentation
[Download the Technical PDF Summary](./Project_2_Complete_DevOps_Guide)

Global Automated Mesh - Phase 2: Production-Ready Infrastructure 

## Overview
Building on Phase 1, this project transitions the Global Automated Mesh into a production-simulated environment. We have shifted from local state management to a high-availability architecture, integrating Terraform, Ansible, Docker, and K3s (Kubernetes) into a unified CI/CD pipeline.

🛠 New Features & Architecture Upgrades
# 1. Remote State Management (The "Anti-Sprawl" Engine)
AWS S3 Backend: Implemented a remote backend for Terraform state files. This ensures that infrastructure state is preserved across different GitHub Action runners, preventing the accidental creation of duplicate resources and allowing for collaborative infrastructure management.

# 2. Full-Stack CI/CD Pipeline (GitHub Actions)
Infrastructure-as-Code (IaC): Automated deployment of VPCs, Subnets, and EC2 instances.

Automated Configuration: Integrated Ansible playbooks to handle the "cold-start" of our servers—installing Docker, K3s, and security dependencies automatically upon server creation.

Container Registry: Automated build and push of the Flask API image to Docker Hub, ensuring the latest code is always ready for deployment.

# 3. Kubernetes Orchestration (K3s)
Microservices Deployment: Migrated the Flask API and PostgreSQL database into a Kubernetes environment using NodePort services for external access.

Self-Healing: Utilized Kubernetes pods to ensure the API stays live even if the application process crashes.

# 4. Advanced Networking & Security
Dynamic Security Groups: Configured precise ingress rules for SSH (22), HTTP (80), and the Kubernetes NodePort range (30000-32767).

Automated Key Management: Dynamic injection of SSH keys to bridge the gap between GitHub Secrets and AWS EC2.

# Technology Stack
Cloud: AWS (EC2, S3, VPC)

IaC: Terraform

Configuration: Ansible

Orchestration: K3s (Lightweight Kubernetes)

CI/CD: GitHub Actions

App Stack: Python (Flask), PostgreSQL, Docker

# How It Works
Code Push: A developer pushes code to feature/full-stack-api.

Infra Sync: Terraform checks the S3 bucket, compares the current state, and updates the AWS infrastructure.

Config: Ansible connects to the new instance, installs the K3s cluster, and copies Kubernetes manifests.

Deployment: Kubernetes pulls the new image from Docker Hub and serves the API on port 30081.

# Lessons Learned
Resource Constraints: Managing Kubernetes on a t2.micro requires careful timing and optimization of the K3s control plane.

Variable Consistency: The importance of strict naming conventions in Python and Kubernetes environment variables (the DB_PASSWORD vs DB_PASS catch!).

State is King: Moving to a remote S3 backend is the fundamental step in graduating from "hobbyist" to "Production DevOps."

# Next
Implementing Prometheus & Grafana for real-time monitoring.

Adding Auto-scaling groups to handle mesh node traffic.
