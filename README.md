# Aircraft-Product-Lifecycle-Management--PLM--System
Aircraft Product Lifecycle Management (PLM) System built using SQL Server and Power BI, featuring BOM management, revision tracking, engineering change management, approval workflows, and lifecycle analytics.

## Overview
The Aircraft Product Lifecycle Management (PLM) System is a database and analytics project designed to simulate how aerospace and manufacturing organizations manage product information throughout the product lifecycle.
The project demonstrates key PLM concepts including Product Structures, Bill of Materials (BOM), Revision Management, Engineering Change Management, Approval Workflows, and Product Lifecycle Tracking. A SQL Server database was used to manage product data, and Power BI was used to create an interactive dashboard for monitoring PLM activities.

## 🧩 Problem Statement
Managing engineering product data manually can result in:
- Difficulty tracking product components
- Version and revision inconsistencies
- Poor visibility into engineering changes
- Inefficient approval workflows
- Challenges in managing product structures and BOMs

This project provides a structured approach to managing product lifecycle information and generating actionable insights through analytics.

## 📌 Objectives
- Design a relational database for Product Lifecycle Management.
- Manage aircraft products and their associated components.
- Track Bills of Materials (BOMs).
- Maintain revision history and version control.
- Monitor engineering change requests.
- Track approval workflows and responsible engineers.
- Visualize PLM metrics using Power BI.

## 🛠️ Technologies Used
- SQL Server
- SQL
- Power BI

## Database Schema
The system consists of the following tables: 
- Product: Stores aircraft products and their lifecycle stages.
- Component: Stores components associated with each product.
- BOM (Bill of Materials): Defines the quantity of components required to manufacture products.
- Revision: Maintains revision history and version control for components.
- ChangeRequest: Tracks engineering change requests raised for components.
- Engineers: Stores engineer information and department details.
- ChangeApproval: Tracks approvals associated with engineering change requests.

Entity Relationship Overview:
Product
   |
   ├── Component
   |      |
   |      └── Revision
   |
   └── BOM

Component
   |
   └── ChangeRequest
             |
             └── ChangeApproval
                        |
                        └── Engineers

## SQL Analysis Performed
Product Structure Analysis: Identified the components belonging to each aircraft product.

BOM Analysis: Analyzed the quantity of components required to manufacture each product.

Revision Analysis: Tracked revision history and identified modified components.
Latest Revision Tracking: Determined the currently active revision for each component.
Engineering Change Analysis: Analyzed approved and pending engineering change requests.
Approval Workflow Analysis: Tracked engineering approvals and engineer participation.
Lifecycle Stage Analysis: Analyzed products across different lifecycle stages.
Product Complexity Analysis: Identified products with the highest component quantity requirements.

## 💡 Key Findings
### Product Overview:
- Total Products: 5
- Total Components: 30
- Total Revisions: 25
- Total Change Requests: 15
- Pending Change Requests: 6
### Product Structure Insights
- Each product consists of 6 components.
- Product structure analysis helped identify component relationships for each aircraft product.
### BOM Insights
- Component quantities required for manufacturing were analyzed through BOM reports.
- Aircraft Wing requires 41 component units.
- Turbofan Engine was identified as the most complex product based on total component quantity requirements.
### Revision Management Insights
- Fan Blade, Compressor Stator, and Turbine Rotor have multiple revisions.
- Revision history enables tracking of design modifications and version control.
- Active revisions were identified for all components.
### Engineering Change Insights
- Change requests were categorized into Approved and Pending statuses.
- 6 engineering change requests are currently pending approval.
- Components with both revision history and change requests were identified.
### Approval Workflow Insights
- Engineer-wise approval activity was analyzed.
- Approval records provide traceability for engineering changes.
### Lifecycle Analysis
Products are distributed across the following lifecycle stages:
- Design
- Development
- Manufacturing
- Testing
- Maintenance
Each lifecycle stage contains one product, providing complete lifecycle coverage.

## 📊 Dashboard
![AirFly Insights Dashboard](images/Dashboard.png)
The dashboard enables stakeholders to monitor:
- Product lifecycle status
- Engineering changes
- Revision activity
- Approval workflows
- Product complexity
- Component distribution

## Skills Demonstrated
- Product Lifecycle Management (PLM)
- Product Data Management (PDM)
- Bill of Materials (BOM) Management
- Revision and Version Control
- Engineering Change Management
- Relational Database Design
- SQL Querying and Analysis
- Data Visualization using Power BI
- Dashboard Development
