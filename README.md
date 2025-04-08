# Voting-App: Distributed Application on AWS EKS

**Voting-App** is a cloud-native, microservices-based application deployed on AWS using **Elastic Kubernetes Service (EKS)**. It leverages modern DevOps tools like Docker, Kubernetes, Terraform, Jenkins, and Ansible to deliver a scalable, automated infrastructure and CI/CD pipeline.

---

## 📦 Project Structure

- `app/` – Microservices source code (vote, worker, result, etc.)
- `k8s/` – Kubernetes manifests for deployment to EKS
- `terraform/` – EKS infrastructure as code
- `ansible/` – Node provisioning and system configuration
- `run_infrastructure.sh` – One-command setup for provisioning and deployment
- `Jenkinsfile` – Jenkins pipeline for building and deploying microservices

---

## 🚀 Deployment Workflow

### 1. Infrastructure Provisioning with Terraform + Ansible

To provision the infrastructure and configure the environment, simply run:

```bash
./run_infrastructure.sh
```

This will:
- Create the EKS cluster and related AWS resources via **Terraform**
- Configure the jenkins node using **Ansible**


### 2. Microservices Deployment via Jenkins

Microservices are automatically built, containerized, and deployed to EKS through a Jenkins pipeline. The `Jenkinsfile` defines:
- Docker builds for each service
- Image pushes to ECR
- Kubernetes deployments and rollouts

---

## 🧩 Architecture Overview



![Voting-App Architecture Diagram](./Architecture%20Diagram.png)

---

## 🛠️ Technologies Used

- Kubernetes (EKS)
- ECR
- Terraform
- Ansible
- Jenkins
- Docker
- Python, Node.js, .NET
- Redis, PostgreSQL

---

## ✅ Prerequisites

- AWS CLI with IAM credentials configured
- Terraform ≥ 1.3
- Ansible ≥ 2.10
- kubectl
- Docker
- Jenkins (local or remote)

---

## 📈 CI/CD Pipeline

The pipeline performs:

- Docker image builds
- Push to ECR
- Kubernetes deployments via `kubectl`

Everything is triggered and handled automatically by Jenkins.


