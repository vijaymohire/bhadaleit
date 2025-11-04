# ⚙️ Bhadale IT Hub — Global Configuration Framework

## Overview
The **Configuration Framework** defines the **global setup, environment templates, and initialization logic** for all modules under the **Bhadale IT Hub Quantum AI (QAI)** ecosystem.  
It centralizes control of environment variables, credentials, and build scaffolds — ensuring consistent deployments across development, testing, research, delivery, and datacenter nodes.

This directory governs the way **projects are created**, **environments are configured**, and **runtime parameters are inherited** throughout the QAI platform stack.

---

## 📂 Folder Structure
```
config/
├── config.ini # Master configuration file for system-wide parameters
├── cookiecutter.json # Project template generator for new QAI repositories
├── environment_templates/ # Environment-specific setup templates (dev, test, prod)
└── README.md
```

---

## 🧩 Core Components

### 1. `config.ini`
> _Central configuration file that defines key-value pairs for all QAI modules._

This file holds environment-wide default parameters used by:
- QAI OS  
- QAI Hub  
- Research Hub  
- Delivery pipelines  
- Analytics and Command Center modules  

**Example:**
```ini
[GLOBAL]
organization = Bhadale IT Hub
version = 1.0.0
timezone = Asia/Kolkata
default_branch = main

[QAI]
environment = hybrid
processor_mode = quantum_classical
datacenter_url = https://qai.bhadaleithub.net
log_level = INFO

---
Usage:
Each system component imports and reads from this file at startup to ensure global parameter consistency.

2. cookiecutter.json

Project scaffolding and repository template configuration.

This file defines templates for creating new projects, frameworks, or repositories with consistent structure and metadata under the Bhadale IT Hub ecosystem.

Example:
{
  "project_name": "QAI_New_Module",
  "author_name": "Vijay Mohire",
  "description": "Template for Quantum AI component",
  "license": "Proprietary - Bhadale IT Hub",
  "version": "0.1.0",
  "use_ci_cd": "yes",
  "include_docs": "true"
}
Purpose:

Accelerates project bootstrapping

Ensures documentation, configuration, and versioning consistency

Enables alignment with internal standards for code, security, and compliance

3. environment_templates/

Standardized environment setup templates for development, testing, and production.

This subfolder includes multiple .env and .yaml templates for various contexts:
environment_templates/
├── dev.env
├── test.env
├── prod.env
└── hybrid_cluster.yaml

Each environment template contains predefined variables and runtime profiles for QAI applications.

Example (dev.env):
# Developer environment
DEBUG=True
DATABASE_URL=sqlite:///local_dev.db
QAI_API_ENDPOINT=http://localhost:8000
LOGGING_LEVEL=DEBUG

Example (prod.env):
# Production configuration
DEBUG=False
DATABASE_URL=postgresql://qai_prod_user@db.qai.net/qai_prod
QAI_API_ENDPOINT=https://api.qai.bhadaleithub.com
LOGGING_LEVEL=WARNING

⚙️ Configuration Hierarchy
[config.ini] → [environment_templates/] → [cookiecutter.json]
     |                 |                         |
     ▼                 ▼                         ▼
  Global Params   Environment Variables     Project Scaffolding
     |                 |                         |
     +-----------------+-------------------------+
                       ▼
          QAI Modules (Processor, OS, Hub, Delivery, etc.)

This hierarchy ensures a top-down configuration cascade, where defaults flow from config.ini, are overridden by environment templates, and project-specific metadata comes from cookiecutter.json.

🔗 Integration Map
| Connected Module   | Function                                                  |
| ------------------ | --------------------------------------------------------- |
| **QAI Hub**        | Reads global config to initialize frameworks and runtimes |
| **QAI OS**         | Uses environment templates for process orchestration      |
| **Analytics**      | Pulls log levels, report intervals, and source endpoints  |
| **Delivery**       | Configures API endpoints for client PoC and demos         |
| **Command Center** | Loads governance rules and system identifiers             |
| **Research**       | Accesses config for simulation or model reproducibility   |

🧭 Governance and Standards

Single Source of Truth:
All configuration parameters must originate or be referenced through this directory.

Version Control:
Configuration files (except local credentials) are versioned under Git.

Separation of Secrets:
Sensitive information (API keys, credentials) is stored in secure vaults, not in .env files.

Environment Consistency:
Templates ensure identical runtime behavior across environments (Dev → Staging → Production)

# Example: loading config.ini
import configparser

config = configparser.ConfigParser()
config.read('bhadaleit/config/config.ini')

org_name = config['GLOBAL']['organization']
env = config['QAI']['environment']

print(f"Running QAI module under {org_name} ({env} mode)")

🧠 Future Extensions

Introduce YAML-based hierarchical configuration (v2.0) for multi-cluster QAI deployments.

Integrate dynamic environment loaders with QAI OS runtime modules.

Add security policy templates for cryptographic and quantum-safe credentials.

Enable ConfigOps automation with GitLab pipelines to auto-sync environment files.

📘 Documentation Standards

Each new configuration item must include:

Parameter Name

Type (string, int, bool, path)

Default Value

Description

Scope (global, module, runtime, or environment)

Maintain configuration documentation in:
config/CONFIG_REFERENCE.md

✳️ Maintainers

Configuration Architect: Vijay Mohire

Supporting Teams: QAI Ops, DevOps, Security, and Platform Engineering

Linked Divisions: Command Center, Research, Delivery, Analytics

© 2025 Bhadale IT Hub — Global Configuration Framework
“Consistency, Reproducibility, and Control — from Code to Quantum Cloud.”
