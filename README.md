# Global Automated Mesh App
A Production-Grade, Multi-Cloud GitOps Architecture for Containerized Application Delivery.

## Problem Statement
Manual cloud provisioning, system configuration, and software delivery is a bottleneck for agile teams, reducing system reliability and increasing operational costs. This project solves this by replacing manual steps with a resilient, validated, and automated infrastructure-as-code (IaC) pipeline.

## Solution
This repository delivers a complete GitOps workflow. On any code commit, a continuous integration/deployment (CI/CD) pipeline automatically validates the code, provisions high-availability AWS infrastructure via Terraform, and bootstraps a Kubernetes (K3s) orchestration cluster on an EC2 worker node via Ansible.

## Key Automation Specializations Demonstrated:
Infrastructure as Code (IaC): 100% automated AWS VPC and EC2 provisioning using Terraform.

Configuration Management: Automated OS hardening and software environment (Docker/K3s) setup using Ansible playbooks.

Continuous Delivery (CD): A Git-triggered, end-to-end pipeline using GitHub Actions to deploy containerized workloads (Nginx).

Orchestration: Implementation of lightweight Kubernetes (K3s) for scalable container management.

## Architecture Overview
![Project Diagram](<Auto mesh App.png>)    
