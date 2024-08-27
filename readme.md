# Multi-Tier Web Application Infrastructure

This project demonstrates how to set up a multi-tier web application infrastructure using Terraform and Ansible. The infrastructure consists of a front-end web server, an application server, and a database server, all provisioned on AWS.

## Project Structure

```plaintext
Multi-Tier_Web_Application/
├── ansible/
│   ├── playbooks/
│       ├── webserver.yml
│       ├── appserver.yml
│       ├── dbserver.yml
│       ├── roles/
│         ├── webserver/
│             ├── tasks
│               ├── main.yml
│         ├── appserver/
│             ├── handlers
│               ├── main.yml
│             ├── tasks
│               ├── main.yml
│         ├── dbserver/
│             ├── tasks
│               ├── main.yml
│   ├── inventory
│       ├── hosts
│   ├── roles
│       ├── webserver
│          ├── files
│             ├── index.html 
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
├── app/
│   ├── index.js
│   ├── package.json
│   ├── .env

