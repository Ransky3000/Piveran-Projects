# PiVeRan Auto Parts — AppSheet Application

![Platform](https://img.shields.io/badge/Platform-AppSheet-4285F4?style=flat-square&logo=google&logoColor=white)
![Data Source](https://img.shields.io/badge/Data%20Source-Google%20Sheets-34A853?style=flat-square&logo=googlesheets&logoColor=white)
![Status](https://img.shields.io/badge/Status-Development-F9AB00?style=flat-square)
![Version](https://img.shields.io/badge/Version-1.000011-5F6368?style=flat-square)

---

## Overview

AppSheet application for managing an automotive parts business and garage operations in the Philippines. Covers vendor sourcing, parts inventory, point-of-sale, purchase requests, job orders, and financial reporting. Built for shop owners, clerks, mechanics, and cashiers. All currency in Philippine Peso (₱).

---

## Key features

- **Parts & inventory** — catalog, multi-supplier mapping, pricing history, stock movements, critical-stock alerts
- **Vendors** — supplier registry, contact management, brand catalog
- **Sales & cash** — cash log, expenses, collectibles, payables, per-user daily sales
- **Purchase requests** — header/line-item workflow, supplier bidding, shipping calculator
- **Garage job orders** — customers, vehicles, labor, mechanic assignments, materials, payments
- **Quality checklists** — per-labor-type QC with photo/video capture
- **Dashboards** — income statement, sales, cash, and inventory dashboards
- **Security** — role-based view and table access control

---

## Application stats

| Tables | Columns | Slices | Views | Actions |
|--------|---------|--------|-------|---------|
| 84     | 934     | 21     | 252   | 279     |

---

## Data architecture

Backend: **Google Sheets** on Google Drive. Three source spreadsheets plus hidden native process tables.

| Spreadsheet | Scope |
|---|---|
| `Vendor.gsheet` | Vendors, brands, parts, inventory, cash, PRs, expenses |
| `Security_Users.gsheet` | Users, roles, role–view assignments |
| `Garage_Customers.gsheet` | Customers, cars, job orders, labor, mechanics, QC checklists |

---

## Module overview

| Module | Key tables | Purpose |
|---|---|---|
| Vendor & Supplier | `Vendor`, `Vendor_contact_numbers`, `Brands` | Supplier registry, contacts, brands |
| Parts & Inventory | `Parts`, `Parts_price`, `Parts_suppliers`, `Inventory_Log`, `Parts_audit` | Catalog, pricing, stock, audits |
| Sales & Cash | `Cash_Log`, `Cash_summary`, `Sales_summary`, `Expense_Type` | Transactions, summaries, expenses |
| Purchase Requests | `Purchase_requests`, `PR_lines`, `PR_lines_suppliers` | Procurement workflow, supplier bidding |
| Garage / Job Orders | `Garage_Customers`, `Garage_Cars`, `Garage_Job_Orders`, `Garage_Job_order_labors`, `Garage_Job_order_materials` | Service management, labor/material tracking |
| Security | `Security_Users`, `Security_Roles`, `Security_User_roles`, `Security_Role_views` | Users, roles, permissions |

---

## Data relationships summary

Relationships use **Ref columns** (FK on child) and **REF_ROWS()** (reverse-lookup on parent).

| Metric | Value |
|---|---|
| Foreign keys | 62 |
| Most connected table | `Parts` — 8 children, 3 parents |
| Deepest nesting | 5 levels (Customers → Cars → Job Orders → Labors → Mechanics) |
| M:N junctions | `Parts_suppliers`, `Security_User_roles` |

See [`PiVeRan_AutoParts_Data_Relationships.md`](PiVeRan%20Auto%20Parts/PiVeRan_AutoParts_Data_Relationships.md) for the full FK matrix and ER diagrams.

---

## Repository structure

```
Piveran-Projects/
├── PiVeRan Auto Parts/
│   ├── Application Documentation.pdf
│   ├── extracted_from_appsheet.txt
│   ├── PiVeRan_AutoParts_Data_Relationships.md
│   └── PiVeRan_AutoParts_Documentation.md
├── LICENSE
└── README.md
```

---

## Documentation files

| File | What it contains | Use for |
|---|---|---|
| [`PiVeRan_AutoParts_Documentation.md`](PiVeRan%20Auto%20Parts/PiVeRan_AutoParts_Documentation.md) | Tables, columns, views, actions, permissions | Onboarding, audits, feature planning |
| [`PiVeRan_AutoParts_Data_Relationships.md`](PiVeRan%20Auto%20Parts/PiVeRan_AutoParts_Data_Relationships.md) | All 62 FKs, ER diagrams, domain maps | Understanding table connections |
| [`Application Documentation.pdf`](PiVeRan%20Auto%20Parts/Application%20Documentation.pdf) | AppSheet-generated full export (PDF) | Offline / printed review |
| [`extracted_from_appsheet.txt`](PiVeRan%20Auto%20Parts/extracted_from_appsheet.txt) | Raw 40,550-line app export | Formulas, automation logic, full detail |

### Using these files with AI

Feed these docs into an LLM (ChatGPT, Gemini, Claude, Copilot, etc.) to speed up understanding and development.

| Step | What to feed | When |
|---|---|---|
| **1. Quick context** | Both `.md` files (~55 KB total) | Default — fits one context window |
| **2. Deep dive** | `extracted_from_appsheet.txt` | Need specific formulas, column settings, or automation rules |
| **3. Visual ref** | `Application Documentation.pdf` | Using a multimodal model that accepts PDFs |

**Example prompts:**
- *"List every table that references Parts and explain the relationship."*
- *"Generate an AppSheet expression for total outstanding payables."*
- *"Suggest schema changes to add warranty tracking."*

---

## Getting started

> **Documentation-only repository** — no executable source code. The live app runs on [AppSheet](https://www.appsheet.com/).

**App ID:** `3df8dccb-b3fb-419c-8b25-c077482253cc`

---

## Documentation changelog

| Date | Author | Changes |
|---|---|---|
| 2026-05-15 | Ranian | Initial documentation — extracted app export, created `PiVeRan_AutoParts_Documentation.md`, `PiVeRan_AutoParts_Data_Relationships.md`, and `README.md` |

---

## License

See [LICENSE](LICENSE).