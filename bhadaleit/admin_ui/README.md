# 🧩 Bhadale IT Hub — QAI Admin UI

## Overview
The **Admin UI** is the **central administrative console** of the Bhadale IT Hub’s **Quantum AI (QAI)** ecosystem.  
It provides a unified graphical and API-driven interface to manage users, assets, COTS integrations, and operational data models across all QAI systems — including QAI Processor, OS, Datacenter, Research Hub, and Delivery Frameworks.

This module combines **data management**, **CRUD automation**, **API orchestration**, and **real-time dashboards**, offering a scalable platform for administration and analytics.

---

## 📂 Folder Structure
```
admin_ui/
├── api/ # REST and GraphQL APIs for system-wide data access
├── crud_admin/ # Administrative CRUD interfaces (users, roles, governance)
├── crud_assets/ # Asset management (hardware, datasets, research artifacts)
├── crud_cots/ # COTS system integration and lifecycle control
├── dashboard/ # Visualization, KPIs, and operational dashboards
├── scripts/ # Automation scripts for setup, testing, and maintenance
└── README.md # Documentation (this file)
```

---

## 🧠 Purpose
The **QAI Admin UI** serves as both:
1. **An administrative control plane** for internal operations, and  
2. **A visualization layer** connecting system analytics, QAI Ops pipelines, and delivery frameworks.

It is used by system administrators, research coordinators, and project leads to:
- Create, read, update, and delete (CRUD) entities across the ecosystem.  
- View performance metrics and project dashboards.  
- Manage COTS integrations and configuration data.  
- Execute automation and monitoring scripts.  

---

## 🧩 Core Submodules

### 1. [`api/`](api/)
> _System-wide API layer for data integration._

Includes:
- REST and GraphQL endpoints for CRUD operations.  
- Authentication and authorization middleware.  
- API documentation and schema definitions (`openapi.yaml` or `schema.graphql`).  
- Integration with external systems (GitLab, QAI Ops, Datacenter APIs).  

---

### 2. [`crud_admin/`](crud_admin/)
> _Administrative management of users, roles, permissions, and system metadata._

Focus:
- User account management  
- Role-based access control (RBAC)  
- Audit logs and governance policies  
- QAI administrative forms and configuration pages  

---

### 3. [`crud_assets/`](crud_assets/)
> _Manages QAI physical and digital assets._

Includes:
- Quantum and classical hardware inventory  
- Software, datasets, and license management  
- Resource allocation and lifecycle tracking  
- Asset status dashboard with analytics integration  

---

### 4. [`crud_cots/`](crud_cots/)
> _Controls integration with Commercial Off-The-Shelf (COTS) products._

Focus:
- Vendor catalog management  
- Procurement and update logs  
- Configuration and interoperability reports  
- Dependency graph for integrated tools (e.g., TensorFlow, Qiskit, AWS Braket)  

---

### 5. [`dashboard/`](dashboard/)
> _Visual command center for KPIs and operational insights._

Contains:
- Interactive dashboards (React + Chart.js / Plotly)  
- Analytics widgets linked to `/analytics/metrics_collector.py`  
- Real-time monitoring for system uptime, delivery progress, and research throughput  
- Custom visualization plugins for QAI Datacenter and Processor telemetry  

---

### 6. [`scripts/`](scripts/)
> _Automation and utility scripts for Admin UI setup, backup, and maintenance._

Includes:
- Database seeding and migration scripts  
- Automated user provisioning utilities  
- Data validation, synchronization, and cleanup tools  
- CI/CD integration hooks (YAML and Python-based)  

---

## ⚙️ Functional Overview

```
               +----------------------------------------+
               |           Admin UI Console             |
               |  (CRUD, Dashboards, Reports, Control)  |
               +------------------+---------------------+
                                  |
                                  ▼
               +----------------------------------------+
               |            API Layer (REST/GraphQL)    |
               |    - Integrates CRUD modules           |
               |    - Auth, Token Management            |
               +----------------------------------------+
                                  |
                                  ▼
    +----------------------------------------------------------+
    |  QAI Core Systems (Processor / Datacenter / Research Hub) |
    +----------------------------------------------------------+
                                  |
                                  ▼
               +----------------------------------------+
               |      Analytics & Delivery Frameworks   |
               |  (Metrics, Reports, Dashboards, Ops)   |
               +----------------------------------------+
```

---

## 🧬 Integration Map

| Connected Module | Function |
|------------------|-----------|
| **`bhadaleit/analytics/`** | Supplies real-time metrics and KPIs to dashboards |
| **`bhadaleit/delivery/`** | Links delivery readiness and project performance data |
| **`bhadaleit/qai_hub/`** | Integrates with frameworks, runtimes, and models |
| **`bhadaleit/research/`** | Pulls metadata, versioned documents, and repository activity |
| **`bhadaleit/qai_ops/`** | Handles runtime automation, monitoring, and alert triggers |

---

## 📘 Configuration Standards

Each submodule follows:
- `config.yml` or `.env` file for environment-specific parameters.  
- `README.md` documenting APIs, CRUD endpoints, or UI logic.  
- Code-level documentation for maintainers (`docstrings`, `@api` annotations).  
- Consistent naming scheme:  
QAI_<Module>_<Entity>_vX.X

---

## 🧭 Development Workflow

1. **Clone & Setup**  
 ```bash
 git clone https://github.com/vijaymohire/bhadaleit
 cd bhadaleit/admin_ui
 pip install -r requirements.txt
```
2. **Run Local Dev Server**
 ```
   python -m uvicorn api.main:app --reload
   ```
3. **Access Dashboard**
Navigate to: http://localhost:8000/dashboard

4. **Access Dashboard**
Navigate to: http://localhost:8000/dashboard

##  🧩 UI Technology Stack

| Layer           | Technology                     | Role                                 |
| --------------- | ------------------------------ | ------------------------------------ |
| **Frontend**    | React.js + Tailwind + Chart.js | Visualization, user control panels   |
| **Backend API** | FastAPI / Flask                | API routing and data services        |
| **Database**    | PostgreSQL / SQLite (dev)      | Persistent storage for CRUD entities |
| **Auth**        | OAuth2 / JWT                   | Role-based access control            |
| **Automation**  | Python scripts, YAML jobs      | CI/CD, metrics sync, DB updates      |

## 🧾 Governance and Access Control

| Role             | Access Level | Permissions                                |
| ---------------- | ------------ | ------------------------------------------ |
| **Admin**        | Full         | CRUD, configuration, analytics, governance |
| **Project Lead** | Partial      | CRUD on assigned assets and delivery data  |
| **Viewer**       | Read-only    | Dashboards, analytics                      |
| **System Bot**   | Automated    | Scheduled maintenance and sync             |

## 🧩 Deliverables

QAI Admin Console (Web + API)

CRUD Automation Modules (Admin, Assets, COTS)

Real-time Dashboard System (QAI KPIs + Research Ops)

Integration Scripts and API Documentation

## ✳️ Maintainers

System Architect: Vijay Mohire

Backend Development: Admin API & CRUD Team

Frontend & Visualization: Dashboard Engineering Unit

Operations: DevOps & ResearchOps Integration Group

© 2025 Bhadale IT Hub — Quantum AI Admin UI Division
“Unifying Control, Data, and Visualization Across the Quantum Intelligence Stack.”
