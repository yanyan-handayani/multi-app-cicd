# 🚀 Multi-Cloud CI/CD Deployment Platform

> Production-ready automated deployment platform for modern web applications across **Google Cloud Platform (GCP)** and **Amazon Web Services (AWS)** using GitHub Actions.

![CI/CD](https://img.shields.io/badge/CI/CD-GitHub%20Actions-blue)
![Cloud](https://img.shields.io/badge/Cloud-GCP%20%7C%20AWS-orange)
![Docker](https://img.shields.io/badge/Container-Docker-blue)
![Nginx](https://img.shields.io/badge/WebServer-Nginx-green)
![Status](https://img.shields.io/badge/Status-Live-success)

---

# 📌 Project Summary

This project demonstrates a **real-world DevOps implementation** for deploying multiple applications into two separate cloud providers with one unified CI/CD pipeline.

It supports:

- Django Application (Gunicorn)
- Laravel Application (PHP-FPM)
- Node.js Application (Docker)
- Static Landing Page
- SSL Automation (Let's Encrypt)
- Reverse Proxy Routing (Nginx)

---

# 🌍 Live Environments

| Platform | URL |
|--------|------|
| GCP | https://gcp.yanyan.my.id |
| AWS | https://aws.yanyan.my.id |

---

# 🏗️ Architecture

```text
Developer Push Code
        ↓
GitHub Repository
        ↓
GitHub Actions CI/CD
        ↓
 ┌──────────────┬──────────────┐
 │              │              │
GCP VM       AWS EC2
 │              │
Nginx Reverse Proxy
 │
 ├── /django
 ├── /laravel
 ├── /node-docker
 └── Landing Page

 ⚙️ Tech Stack
Cloud Infrastructure
Google Compute Engine
Amazon EC2
Debian Linux
Backend Applications
Django + Gunicorn
Laravel + PHP-FPM
Node.js + Docker
DevOps Stack
GitHub Actions
Shell Automation
Docker Compose
Nginx
Let's Encrypt SSL

🚀 CI/CD Workflow
Auto Deployment Process
Push code to main
GitHub Actions triggered
SSH secure connection to servers
Pull latest source
Build containers
Restart services
Health check

multi-app-cicd/
├── apps/
│   ├── django/
│   ├── laravel/
│   ├── node/
│   └── landing/
│
├── nginx/
│   ├── gcp.conf
│   └── aws.conf
│
├── scripts/
│   ├── deploy-gcp.sh
│   ├── deploy-aws.sh
│   ├── deploy-django.sh
│   ├── deploy-laravel.sh
│   └── common.sh
│
└── .github/workflows/deploy.yml

🎯 Key Features

✅ Multi-cloud deployment
✅ Single pipeline CI/CD
✅ Docker + Native hybrid deployment
✅ Automated provisioning
✅ SSL auto renewal
✅ Reverse proxy routing
✅ Zero-downtime friendly design
✅ Scalable architecture

💼 Business Use Cases

This architecture is ideal for:

Startup MVP Deployment
SaaS Applications
Company Internal Systems
Multi-environment Apps
Portfolio Demonstration
Production DevOps Automation

📈 Value Delivered

This project proves hands-on experience in:

Linux Administration
Cloud Infrastructure
CI/CD Engineering
Reverse Proxy Design
Application Deployment
Production Troubleshooting
Infrastructure Automation
👨‍💻 Author

Yan Yan Handayani
Backend & DevOps Engineer
Indonesia

Available for freelance / contract / remote work.

📬 Contact

If you need similar implementation:

CI/CD Setup
Docker Deployment
AWS / GCP Infrastructure
Laravel / Django Deployment
DevOps Automation

Let's connect.