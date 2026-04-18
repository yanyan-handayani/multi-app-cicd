# 🚀 Multi-Cloud CI/CD Deployment Platform  
### (GCP + AWS | Nginx | Docker | Django | Laravel | Node.js)

---

## 📌 Overview

Project ini adalah implementasi **end-to-end CI/CD pipeline** untuk deployment aplikasi multi-stack ke **multi-cloud environment (GCP & AWS)** menggunakan:

- ⚙️ GitHub Actions (CI/CD Automation)
- 🌐 Nginx (Reverse Proxy + SSL)
- 🐳 Docker (Node.js Service)
- 🐍 Django (Native Deployment)
- 🐘 Laravel (Native Deployment - PHP-FPM)
- 🔒 Let's Encrypt (Auto SSL)

Dirancang untuk:
- Production-ready deployment
- Scalable architecture
- Clean DevOps workflow
- Low operational overhead

---

## 🎯 Key Features

✅ Multi-cloud deployment (GCP + AWS)  
✅ Single pipeline CI/CD (GitHub Actions)  
✅ Hybrid deployment (Docker + Native)  
✅ Automated provisioning via shell scripts  
✅ SSL otomatis (Let's Encrypt)  
✅ Reverse proxy (Nginx)  
✅ Zero manual deployment  
✅ Easy rollback strategy  

---

## 🧱 Architecture
            ┌──────────────────────┐
            │     GitHub Repo      │
            │   (multi-app-cicd)   │
            └─────────┬────────────┘
                      │
                      ▼
            ┌──────────────────────┐
            │  GitHub Actions CI   │
            └─────────┬────────────┘
                      │ SSH
    ┌─────────────────┴─────────────────┐
    ▼                                   ▼
┌───────────────┐               ┌───────────────┐
│ GCP VM        │               │ AWS EC2       │
│ Debian Server │               │ Debian Server │
└──────┬────────┘               └──────┬────────┘
       ▼                               ▼
┌───────────────────────────────────────────────┐
│ NGINX (SSL)                                   │
├──────────────┬──────────────┬─────────────────┤
│ Landing      │ Django       │ Laravel         │
│ Static       │ (Gunicorn)   │ (PHP-FPM)       │
├──────────────┴──────────────┴─────────────────┤
│ Node.js (Docker Container)                    │
└───────────────────────────────────────────────┘

---

## 🌐 Live Environment

| Platform | URL |
|--------|-----|
| GCP | https://gcp.yanyan.my.id |
| AWS | https://aws.yanyan.my.id |

---

## 🧩 Tech Stack

### Backend
- Django (Python 3.11+)
- Laravel (PHP 8.4)
- Node.js (Dockerized)

### DevOps
- GitHub Actions
- Bash Automation Scripts
- Docker & Docker Compose

### Infrastructure
- GCP Compute Engine
- AWS EC2
- Debian 12 / 13

### Web Server
- Nginx (Reverse Proxy)

### Security
- Let's Encrypt SSL
- SSH Key Authentication

---

## 📁 Project Structure

multi-app-cicd/
├── apps/
│ ├── django/ # Django App
│ ├── laravel/ # Laravel App
│ ├── node/ # Node.js App (Docker)
│ └── landing/ # Static Landing Page
│
├── nginx/
│ ├── gcp.conf
│ └── aws.conf
│
├── scripts/
│ ├── common.sh
│ ├── deploy-gcp.sh
│ ├── deploy-aws.sh
│ ├── deploy-django.sh
│ ├── deploy-laravel.sh
│ └── deploy-landing.sh
│
├── docker-compose.yml
└── .github/workflows/deploy.yml


---

## ⚙️ CI/CD Workflow

### 🔄 Deployment Flow

1. Developer push ke `main`
2. GitHub Actions trigger
3. SSH ke GCP & AWS
4. Execute deploy script:
   - update repo
   - build docker
   - deploy apps
   - update nginx
5. Reload service

---

## 🔐 GitHub Secrets
AWS_HOST
AWS_USER
AWS_SSH_KEY

GCP_HOST
GCP_USER
GCP_SSH_KEY


---

## 🚀 Deployment Strategy

### Hybrid Approach

| Service | Method |
|--------|-------|
| Node.js | Docker |
| Django | Native (Gunicorn) |
| Laravel | Native (PHP-FPM) |
| Nginx | System Service |

---

## 🐳 Docker Service

```bash id="docker-run"
docker compose up -d --

🐍 Django Setup
cd apps/django
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
gunicorn app.wsgi:application

🐘 Laravel Setup
cd apps/laravel
cp .env.example .env
composer install
php artisan key:generate

🔒 SSL Setup
sudo certbot --nginx -d gcp.yanyan.my.id
sudo certbot --nginx -d aws.yanyan.my.id

🔄 Rollback Strategy

Manual rollback:
git checkout <commit_id>
bash scripts/deploy-gcp.sh
bash scripts/deploy-aws.sh

🧪 Health Check
curl http://localhost:3000

⚠️ Known Issues & Solutions
Permission Error /opt
sudo chown -R $USER:$USER /opt/multi-app-cicd

Laravel 404
Periksa root nginx → harus ke public
Pastikan index.php aktif
Django Error
Pastikan requirements.txt tersedia
Pastikan virtualenv aktif
📈 Future Improvements
🔄 Auto rollback on failure
📊 Monitoring (Prometheus + Grafana)
🟢 Blue-Green Deployment
🔐 Secrets management (Vault)
🌍 Multi-environment (dev/staging/prod)
💼 Use Cases
Startup MVP deployment
DevOps portfolio project
Multi-service backend deployment
Hybrid infrastructure learning
👨‍💻 Author

Yanyan Handayani
Backend & DevOps Engineer

⭐ Value Proposition

Project ini menunjukkan kemampuan:

✔ Real-world CI/CD implementation
✔ Multi-cloud deployment
✔ Hybrid architecture (Docker + Native)
✔ Production-ready setup
✔ Automation mindset

📬 Contact

Jika ingin implementasi serupa:

CI/CD setup
Cloud deployment
DevOps automation

👉 Available for freelance & project work


