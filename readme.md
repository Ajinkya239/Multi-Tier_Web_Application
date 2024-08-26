# Multi-Tier Web Application Infrastructure

This project demonstrates how to set up a multi-tier web application infrastructure using Terraform and Ansible. The infrastructure consists of a front-end web server, an application server, and a database server, all provisioned on AWS.

## Project Structure

```plaintext
multi-tier-app/
├── ansible/
│   ├── playbooks/
│   │   ├── webserver.yml
│   │   ├── appserver.yml
│   │   ├── dbserver.yml
│   ├── roles/
│       ├── webserver/
│       ├── appserver/
│       ├── dbserver/
│   ├── inventory
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
