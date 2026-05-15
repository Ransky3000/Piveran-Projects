# PiVeRan Auto Parts — Data Relationships Reference

> **App:** PiVeRan Auto Parts - Dev
> **App ID:** `3df8dccb-b3fb-419c-8b25-c077482253cc`
> **Extracted from:** 40,550-line AppSheet application export
> **Scope:** All `Ref` (foreign key) columns and `REF_ROWS` (reverse-lookup) relationships across all 84 tables

---

## How to Read This Document

AppSheet expresses relationships in two ways:

| Mechanism | Direction | How it works |
|---|---|---|
| **`Ref` column** | Child → Parent | A column in the child table holds the ID of the parent record (foreign key) |
| **`REF_ROWS()` formula** | Parent → Children | A virtual column in the parent table lists all child rows that reference it |

Together, they form **bidirectional one-to-many relationships**. This document maps every relationship found in the application, organized by domain.

---

## Table of Contents

1. [Vendor & Supplier Domain](#1-vendor--supplier-domain)
2. [Parts & Inventory Domain](#2-parts--inventory-domain)
3. [Cash & Sales Domain](#3-cash--sales-domain)
4. [Purchase Request Domain](#4-purchase-request-domain)
5. [Garage / Job Order Domain](#5-garage--job-order-domain)
6. [Security & Access Control Domain](#6-security--access-control-domain)
7. [Complete Relationship Matrix](#7-complete-relationship-matrix)
8. [Entity Relationship Summary Diagram](#8-entity-relationship-summary-diagram)

---

## 1. Vendor & Supplier Domain

### Vendor (Parent)

The `Vendor` table is the master supplier registry. Four child tables reference it directly.

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Inventory_Log` | `Vendor_ID` | Each stock transaction records which vendor supplied the goods |
| `Parts_suppliers` | `Supplier_ID` | Links a part to all vendors that supply it |
| `Vendor_contact_numbers` | `Vendor_ID` | One vendor can have many contact numbers |
| `PR_lines_suppliers` | `Vendor_ID` | Purchase request lines can be assigned to specific vendors |
| `PR_lines` | `Supplier_ID` | A PR line can be associated with a preferred vendor |
| `Parts` | `Latest Supplier` | Tracks the most recently used supplier for a part (soft reference) |

**Relationship diagram:**
```
Vendor
  ├── Inventory_Log          (via Vendor_ID)
  ├── Parts_suppliers        (via Supplier_ID)
  ├── Vendor_contact_numbers (via Vendor_ID)
  ├── PR_lines_suppliers     (via Vendor_ID)
  ├── PR_lines               (via Supplier_ID)
  └── Parts                  (via Latest Supplier — soft/computed ref)
```

---

## 2. Parts & Inventory Domain

### Brands (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Parts` | `Brand_ID` | Each part belongs to one brand |

### Cabinet_Codes (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Parts` | `Cabinet_code_ID` | Each part is stored in one cabinet location |

### Parts (Parent + Child)

`Parts` is both a child of `Brands` and `Cabinet_Codes`, and a central parent to many child tables.

**As a parent — children of Parts:**

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Parts_photos` | `Part_ID` | Photo attachments for a part |
| `Parts_price` | `Part_ID` | Price history entries for a part |
| `Parts_suppliers` | `Part_ID` | Supplier mappings for a part |
| `Inventory_Log` | `Part_ID` | All stock movement records for a part |
| `Add_stocks_price_history_RO` | `Part_ID` | Read-only view of stock-add price history per part (slice) |
| `PR_lines` | `Part_ID` | Purchase request line items for a part |
| `Parts_audit` | `Part` | Audit/count records for a part |
| `Garage_Job_order_materials` | `Material` | Job order material usage referencing a part |

**As a child — Parts references:**

| Referenced Parent | Foreign Key on Parts | Relationship Description |
|---|---|---|
| `Brands` | `Brand_ID` | Part belongs to a brand |
| `Cabinet_Codes` | `Cabinet_code_ID` | Part stored in a cabinet |
| `Vendor` | `Latest Supplier` | Most recent supplier for this part |

**Relationship diagram:**
```
Brands ──────────────────────────────────────────────┐
Cabinet_Codes ────────────────────────────────────────┤
Vendor (Latest Supplier) ────────────────────────────►Parts
                                                         ├── Parts_photos              (via Part_ID)
                                                         ├── Parts_price               (via Part_ID)
                                                         ├── Parts_suppliers           (via Part_ID)
                                                         ├── Inventory_Log             (via Part_ID)
                                                         ├── Add_stocks_price_hist._RO (via Part_ID)
                                                         ├── PR_lines                  (via Part_ID)
                                                         ├── Parts_audit               (via Part)
                                                         └── Garage_Job_order_materials(via Material)
```

### Parts_audit_status (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Parts_audit` | `Status` | Audit records reference a status lookup value |

### Inventory_Action (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Inventory_Log` | `Action_ID` | Each inventory transaction has an action type (e.g. Add Stock, Sale) |

### Units (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Inventory_Log` | `Unit_ID` | Each stock transaction records the unit of measure |

### Sales_type (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Inventory_Log` | `Sales_Type` | Sales transactions are classified by sales type |

### Add_stock_payment_type (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Inventory_Log` | `Add_stock_Payment_Type` | Stock additions record the payment type used |

### Inventory_Log (Child — all foreign keys)

| Foreign Key Column | Referenced Parent Table | Description |
|---|---|---|
| `Vendor_ID` | `Vendor` | The supplier for this transaction |
| `Part_ID` | `Parts` | The part involved in this transaction |
| `Action_ID` | `Inventory_Action` | The type of action (add, sale, adjustment, etc.) |
| `Unit_ID` | `Units` | Unit of measure for the quantity |
| `Sales_Type` | `Sales_type` | Sales classification |
| `Add_stock_Payment_Type` | `Add_stock_payment_type` | Payment method for stock additions |

---

## 3. Cash & Sales Domain

### Cash_action (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Cash_Log` | `Action_ID` | Each cash entry has an action type |

### Expense_Type (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Cash_Log` | `Expense Type` | Cash entries classified as expenses reference this lookup |

### Operating_Expense_type (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Cash_Log` | `Operating Expense Type` | Operating expenses reference this sub-category lookup |

### Cash_Log (Child — all foreign keys)

| Foreign Key Column | Referenced Parent Table | Description |
|---|---|---|
| `Action_ID` | `Cash_action` | Type of cash transaction |
| `Expense Type` | `Expense_Type` | Expense classification |
| `Operating Expense Type` | `Operating_Expense_type` | Operating expense sub-classification |

**Relationship diagram:**
```
Cash_action           ──┐
Expense_Type          ──┤
Operating_Expense_type──►Cash_Log
```

---

## 4. Purchase Request Domain

### PR_Status (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Purchase_requests` | `Status` | Each PR has a status from this lookup |

### PR_lines_Status (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `PR_lines` | `Status` | Each PR line item has a status from this lookup |

### Purchase_requests (Parent + Child)

**As a parent:**

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `PR_lines` | `Purchase_request_ID` | A purchase request contains one or many line items |
| `PR_comments` | `PR_ID` | Comments thread attached to a purchase request |

**As a child:**

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `Status` | `PR_Status` | Current status of the request |

### PR_lines (Parent + Child)

**As a parent:**

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `PR_lines_suppliers` | `PR_Lines_ID` | Supplier bids/assignments per PR line |
| `PR_line_comments` | `PR_Line_ID` | Comments on a specific PR line item |
| `PR_Lines_photos` | `PR_Line_ID` | Photo attachments on a PR line item |

**As a child:**

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `Purchase_request_ID` | `Purchase_requests` | The parent purchase request |
| `Part_ID` | `Parts` | The part being requested |
| `Status` | `PR_lines_Status` | Current status of this line |
| `Supplier_ID` | `Vendor` | Preferred or assigned vendor for this line |

### PR_lines_suppliers (Child)

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `PR_Lines_ID` | `PR_lines` | The parent PR line item |
| `Vendor_ID` | `Vendor` | The vendor being considered for this line |

**Full Purchase Request domain hierarchy:**
```
PR_Status ──────────────────────────────────────────────────────────────────┐
                                                                             ▼
Vendor ───────────────────────────────────────────────────────► Purchase_requests
                                                                    ├── PR_comments     (via PR_ID)
                                                                    └── PR_lines        (via Purchase_request_ID)
                                                                             │
                                             Parts ──────────────────────────┤ (via Part_ID)
                                       PR_lines_Status ──────────────────────┤ (via Status)
                                             Vendor ─────────────────────────┤ (via Supplier_ID)
                                                                             ├── PR_lines_suppliers (via PR_Lines_ID)
                                                                             │        └── Vendor   (via Vendor_ID)
                                                                             ├── PR_line_comments  (via PR_Line_ID)
                                                                             └── PR_Lines_photos   (via PR_Line_ID)
```

---

## 5. Garage / Job Order Domain

This is the most complex domain in the application, with deep nesting across customers, vehicles, job orders, labor, materials, mechanics, and quality control.

### Garage_Customers (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_customer_address` | `Customer` | A customer can have multiple addresses |
| `Garage_Customer_contact_numbers` | `Customer` | A customer can have multiple contact numbers |
| `Garage_Cars` | `Primary Owner` | A customer owns one or more vehicles |
| `Garage_Job_Orders` | `Primary Contact` | A customer is the primary contact for job orders |

### Garage_Cars (Parent + Child)

**As a parent:**

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Job_Orders` | `Car` | A vehicle has one or more job orders |
| `Garage_Car_photos` | `Car` | Photo attachments for a vehicle |

**As a child:**

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `Primary Owner` | `Garage_Customers` | The customer who owns this vehicle |

### Garage_Job_orders_status (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Job_Orders` | `Status` | Job orders reference a status lookup |

### Garage_Job_Orders (Parent + Child)

**As a parent — children of a Job Order:**

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Job_order_labors` | `Job Order` | Labor tasks performed under this job order |
| `Garage_Job_order_materials` | `Job Order` | Parts/materials consumed under this job order |
| `Garage_Job_order_payments` | `Job Order` | Payment records for this job order |
| `Garage_Job_order_photos` | `Job Order` | Photo documentation for this job order |
| `Garage_Job_order_comments` | `Job Order` | Comments/notes on this job order |

**As a child:**

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `Primary Contact` | `Garage_Customers` | The customer who owns this job |
| `Car` | `Garage_Cars` | The vehicle being serviced |
| `Status` | `Garage_Job_orders_status` | Current job order status |

### Garage_Labor_Types (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Labor_Prices` | `Labor Type` | Price definitions for each labor type |
| `Garage_Job_order_labors` | `Labor` | Job order labor items reference a labor type |
| `Garage_Lapor_Type_Quality_Checklist` | `Labor Type` | Quality checklist items associated with a labor type |

### Garage_Job_order_labor_status (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Job_order_labors` | `Status` | Labor items reference a status lookup |

### Garage_Job_order_labors (Parent + Child)

**As a parent:**

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Job_order_labor_mechanics` | `Job Order Labor` | Mechanic assignments to a labor item |
| `Garage_JO_labor_comments` | `JO Labor` | Comments on a specific labor item |
| `Garage_JO_labor_photos` | `JO Labor` | Photo documentation for a labor item |

**As a child:**

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `Job Order` | `Garage_Job_Orders` | The parent job order |
| `Labor` | `Garage_Labor_Types` | The type of labor being performed |
| `Status` | `Garage_Job_order_labor_status` | Current status of this labor item |

### Garage_Mechanics (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Mechanics_contact_numbers` | `Mechanic` | Contact numbers for a mechanic |
| `Garage_Job_order_labor_mechanics` | `Mechanic` | Job labor assignments for a mechanic |

### Garage_Job_order_labor_mechanics (Child)

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `Job Order Labor` | `Garage_Job_order_labors` | The labor item this mechanic is assigned to |
| `Mechanic` | `Garage_Mechanics` | The mechanic performing the labor |

### Garage_Job_order_materials_status (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Job_order_materials` | `Status` | Materials reference a status lookup |

### Garage_Job_order_materials (Parent + Child)

**As a parent:**

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_JO_materials_comments` | `JO Material` | Comments on a specific material line |
| `Garage_JO_materials_photos` | `JO Material` | Photo documentation for a material line |

**As a child:**

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `Job Order` | `Garage_Job_Orders` | The parent job order |
| `Material` | `Parts` | The part/material being used |
| `Status` | `Garage_Job_order_materials_status` | Current status of this material item |

### Garage_Cashiers (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Job_order_payments` | `Prepaired By` | The cashier who processed the payment |

### Garage_Quality_Checklist (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Garage_Quality_Checklist_Photos` | `Quality Checklist` | Photos attached to a checklist entry |
| `Garage_Quality_Checklist_Videos` | `Quality Checklist` | Videos attached to a checklist entry |
| `Garage_Lapor_Type_Quality_Checklist` | `Quality Checklist` | Labor type associations for a checklist |

### Garage_Lapor_Type_Quality_Checklist (Child)

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `Labor Type` | `Garage_Labor_Types` | The labor type this checklist item applies to |
| `Quality Checklist` | `Garage_Quality_Checklist` | The checklist this entry belongs to |

**Full Garage domain hierarchy:**
```
Garage_Customers
  ├── Garage_customer_address             (via Customer)
  ├── Garage_Customer_contact_numbers     (via Customer)
  ├── Garage_Cars                         (via Primary Owner)
  │     ├── Garage_Car_photos             (via Car)
  │     └── Garage_Job_Orders             (via Car)
  │
  └── Garage_Job_Orders                   (via Primary Contact)
        │   [also ref: Garage_Job_orders_status → Status]
        ├── Garage_Job_order_photos       (via Job Order)
        ├── Garage_Job_order_comments     (via Job Order)
        ├── Garage_Job_order_payments     (via Job Order)
        │     └── Garage_Cashiers         (via Prepaired By)
        │
        ├── Garage_Job_order_labors       (via Job Order)
        │     │   [also ref: Garage_Labor_Types → Labor]
        │     │   [also ref: Garage_Job_order_labor_status → Status]
        │     ├── Garage_JO_labor_photos  (via JO Labor)
        │     ├── Garage_JO_labor_comments(via JO Labor)
        │     └── Garage_Job_order_labor_mechanics (via Job Order Labor)
        │           └── Garage_Mechanics  (via Mechanic)
        │                 └── Garage_Mechanics_contact_numbers (via Mechanic)
        │
        └── Garage_Job_order_materials    (via Job Order)
              │   [also ref: Parts → Material]
              │   [also ref: Garage_Job_order_materials_status → Status]
              ├── Garage_JO_materials_photos   (via JO Material)
              └── Garage_JO_materials_comments (via JO Material)

Garage_Labor_Types
  ├── Garage_Labor_Prices                 (via Labor Type)
  ├── Garage_Job_order_labors             (via Labor)
  └── Garage_Lapor_Type_Quality_Checklist (via Labor Type)
        └── Garage_Quality_Checklist      (via Quality Checklist)
              ├── Garage_Quality_Checklist_Photos (via Quality Checklist)
              └── Garage_Quality_Checklist_Videos (via Quality Checklist)
```

---

## 6. Security & Access Control Domain

### Security_Users (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Security_User_roles` | `User` | A user can be assigned to multiple roles |

### Security_Roles (Parent)

| Child Table | Foreign Key Column | Relationship Description |
|---|---|---|
| `Security_User_roles` | `Role` | A role can be assigned to multiple users |
| `Security_Role_views` | `Role` | A role grants access to specific views |
| `Security_Role_tables` | `Role` | A role grants access to specific tables |

### Security_User_roles (Child — junction table)

| Foreign Key Column | Referenced Parent | Description |
|---|---|---|
| `User` | `Security_Users` | The user being assigned a role |
| `Role` | `Security_Roles` | The role being assigned |

> `Security_User_roles` is a **many-to-many junction table** between `Security_Users` and `Security_Roles`.

**Relationship diagram:**
```
Security_Users ────────────────────────────────────────► Security_User_roles ◄── Security_Roles
                                                                                        │
                                                                                        ├── Security_Role_views  (via Role)
                                                                                        └── Security_Role_tables (via Role)
```

---

## 7. Complete Relationship Matrix

This table lists every foreign key in the system in a single consolidated view.

| Child Table | FK Column | Parent Table | Notes |
|---|---|---|---|
| `Cash_Log` | `Action_ID` | `Cash_action` | Transaction type lookup |
| `Cash_Log` | `Expense Type` | `Expense_Type` | Expense category |
| `Cash_Log` | `Operating Expense Type` | `Operating_Expense_type` | Operating expense sub-category |
| `Parts` | `Brand_ID` | `Brands` | Brand reference |
| `Parts` | `Cabinet_code_ID` | `Cabinet_Codes` | Storage location |
| `Parts` | `Latest Supplier` | `Vendor` | Most recent supplier (computed) |
| `Parts_photos` | `Part_ID` | `Parts` | Photo attachment |
| `Parts_price` | `Part_ID` | `Parts` | Price history entry |
| `Parts_suppliers` | `Part_ID` | `Parts` | Part-to-vendor mapping |
| `Parts_suppliers` | `Supplier_ID` | `Vendor` | Vendor in the mapping |
| `Parts_audit` | `Part` | `Parts` | Audit target part |
| `Parts_audit` | `Status` | `Parts_audit_status` | Audit status lookup |
| `Vendor_contact_numbers` | `Vendor_ID` | `Vendor` | Contact belongs to vendor |
| `Inventory_Log` | `Vendor_ID` | `Vendor` | Transaction supplier |
| `Inventory_Log` | `Part_ID` | `Parts` | Transaction part |
| `Inventory_Log` | `Action_ID` | `Inventory_Action` | Transaction type |
| `Inventory_Log` | `Unit_ID` | `Units` | Unit of measure |
| `Inventory_Log` | `Sales_Type` | `Sales_type` | Sales classification |
| `Inventory_Log` | `Add_stock_Payment_Type` | `Add_stock_payment_type` | Payment method |
| `Purchase_requests` | `Status` | `PR_Status` | PR status lookup |
| `PR_lines` | `Purchase_request_ID` | `Purchase_requests` | Parent PR |
| `PR_lines` | `Part_ID` | `Parts` | Requested part |
| `PR_lines` | `Status` | `PR_lines_Status` | Line status lookup |
| `PR_lines` | `Supplier_ID` | `Vendor` | Assigned vendor |
| `PR_lines_suppliers` | `PR_Lines_ID` | `PR_lines` | Parent PR line |
| `PR_lines_suppliers` | `Vendor_ID` | `Vendor` | Vendor candidate |
| `PR_comments` | `PR_ID` | `Purchase_requests` | Parent PR |
| `PR_line_comments` | `PR_Line_ID` | `PR_lines` | Parent PR line |
| `PR_Lines_photos` | `PR_Line_ID` | `PR_lines` | Parent PR line |
| `Security_User_roles` | `User` | `Security_Users` | User reference |
| `Security_User_roles` | `Role` | `Security_Roles` | Role reference |
| `Security_Role_views` | `Role` | `Security_Roles` | Role reference |
| `Security_Role_tables` | `Role` | `Security_Roles` | Role reference |
| `Garage_customer_address` | `Customer` | `Garage_Customers` | Customer reference |
| `Garage_Customer_contact_numbers` | `Customer` | `Garage_Customers` | Customer reference |
| `Garage_Cars` | `Primary Owner` | `Garage_Customers` | Owner reference |
| `Garage_Car_photos` | `Car` | `Garage_Cars` | Vehicle reference |
| `Garage_Job_Orders` | `Primary Contact` | `Garage_Customers` | Customer reference |
| `Garage_Job_Orders` | `Car` | `Garage_Cars` | Vehicle reference |
| `Garage_Job_Orders` | `Status` | `Garage_Job_orders_status` | Status lookup |
| `Garage_Job_order_labors` | `Job Order` | `Garage_Job_Orders` | Parent job order |
| `Garage_Job_order_labors` | `Labor` | `Garage_Labor_Types` | Labor type |
| `Garage_Job_order_labors` | `Status` | `Garage_Job_order_labor_status` | Labor status lookup |
| `Garage_Job_order_labor_mechanics` | `Job Order Labor` | `Garage_Job_order_labors` | Parent labor item |
| `Garage_Job_order_labor_mechanics` | `Mechanic` | `Garage_Mechanics` | Assigned mechanic |
| `Garage_Mechanics_contact_numbers` | `Mechanic` | `Garage_Mechanics` | Mechanic reference |
| `Garage_Job_order_materials` | `Job Order` | `Garage_Job_Orders` | Parent job order |
| `Garage_Job_order_materials` | `Material` | `Parts` | Part/material used |
| `Garage_Job_order_materials` | `Status` | `Garage_Job_order_materials_status` | Material status lookup |
| `Garage_Job_order_payments` | `Job Order` | `Garage_Job_Orders` | Parent job order |
| `Garage_Job_order_payments` | `Prepaired By` | `Garage_Cashiers` | Processing cashier |
| `Garage_Job_order_comments` | `Job Order` | `Garage_Job_Orders` | Parent job order |
| `Garage_Job_order_photos` | `Job Order` | `Garage_Job_Orders` | Parent job order |
| `Garage_JO_labor_photos` | `JO Labor` | `Garage_Job_order_labors` | Parent labor item |
| `Garage_JO_labor_comments` | `JO Labor` | `Garage_Job_order_labors` | Parent labor item |
| `Garage_JO_materials_photos` | `JO Material` | `Garage_Job_order_materials` | Parent material item |
| `Garage_JO_materials_comments` | `JO Material` | `Garage_Job_order_materials` | Parent material item |
| `Garage_Labor_Prices` | `Labor Type` | `Garage_Labor_Types` | Labor type reference |
| `Garage_Quality_Checklist_Photos` | `Quality Checklist` | `Garage_Quality_Checklist` | Parent checklist |
| `Garage_Quality_Checklist_Videos` | `Quality Checklist` | `Garage_Quality_Checklist` | Parent checklist |
| `Garage_Lapor_Type_Quality_Checklist` | `Labor Type` | `Garage_Labor_Types` | Labor type reference |
| `Garage_Lapor_Type_Quality_Checklist` | `Quality Checklist` | `Garage_Quality_Checklist` | Parent checklist |

**Total foreign keys documented: 62**

---

## 8. Entity Relationship Summary Diagram

The following ASCII diagram shows the top-level entity relationships across all domains. Arrows point from child to parent (→ = "references").

```
╔══════════════════════════════════════════════════════════════════════════════╗
║                    LOOKUP / REFERENCE TABLES                                ║
╠══════════════════════════════════════════════════════════════════════════════╣
║  Brands  Cabinet_Codes  Inventory_Action  Units  Sales_type                 ║
║  Cash_action  Expense_Type  Operating_Expense_type  Add_stock_payment_type  ║
║  PR_Status  PR_lines_Status  Parts_audit_status                              ║
║  Garage_Job_orders_status  Garage_Job_order_labor_status                    ║
║  Garage_Job_order_materials_status  Garage_Cashiers                         ║
╚══════════════════════════════════════════════════════════════════════════════╝
          │ (all referenced by domain tables below)
          ▼

╔══════════════╗       ╔══════════════════════════════╗
║    VENDOR    ║──────►║          PARTS               ║
╚══════════════╝  Sup  ╚══════════════════════════════╝
       │                         │
       │                         ├── Parts_photos
       │                         ├── Parts_price
       │                         ├── Parts_suppliers ◄─── Vendor
       │                         ├── Parts_audit
       │                         ├── Inventory_Log ◄──────── Vendor
       │                         │       (Action, Unit, Sales_type, Payment_type)
       │                         └── PR_lines ──────────► Purchase_requests
       │                                                         │
       └─────────────────────────────────────────────────────────┤
              (Supplier_ID on PR_lines, PR_lines_suppliers)      │
                                                           PR_comments
                                                           PR_lines
                                                              ├── PR_lines_suppliers ◄── Vendor
                                                              ├── PR_line_comments
                                                              └── PR_Lines_photos

╔══════════════════╗
║ Garage_Customers ║
╚══════════════════╝
       ├── Garage_customer_address
       ├── Garage_Customer_contact_numbers
       ├── Garage_Cars
       │       ├── Garage_Car_photos
       │       └── Garage_Job_Orders ◄────────────── Parts (via Material)
       │                 │           ◄────────────── Garage_Labor_Types
       └──────────────────────────────────────────────────────────────
                         │
                         ├── Garage_Job_order_photos
                         ├── Garage_Job_order_comments
                         ├── Garage_Job_order_payments ◄── Garage_Cashiers
                         │
                         ├── Garage_Job_order_labors
                         │       ├── Garage_JO_labor_photos
                         │       ├── Garage_JO_labor_comments
                         │       └── Garage_Job_order_labor_mechanics ◄── Garage_Mechanics
                         │                                                       └── Mechanics_contact_numbers
                         └── Garage_Job_order_materials
                                 ├── Garage_JO_materials_photos
                                 └── Garage_JO_materials_comments

╔═════════════════╗     ╔══════════════════════════╗
║ Security_Users  ║────►║  Security_User_roles     ║◄── Security_Roles
╚═════════════════╝     ╚══════════════════════════╝          │
                                                              ├── Security_Role_views
                                                              └── Security_Role_tables

╔══════════════════════════════╗
║  Garage_Labor_Types          ║
╚══════════════════════════════╝
       ├── Garage_Labor_Prices
       ├── Garage_Job_order_labors   (already shown above)
       └── Garage_Lapor_Type_Quality_Checklist ◄── Garage_Quality_Checklist
                                                          ├── Quality_Checklist_Photos
                                                          └── Quality_Checklist_Videos
```

---

## Key Observations

**Most connected table:** `Parts` — referenced by 8 child tables and itself references 3 parents. It bridges the inventory, purchasing, and garage domains.

**Deepest nesting:** The Garage domain has the deepest chain at 5 levels:
`Garage_Customers → Garage_Cars → Garage_Job_Orders → Garage_Job_order_labors → Garage_Job_order_labor_mechanics`

**Many-to-many relationships:** Two junction tables exist:
- `Parts_suppliers` — resolves many-to-many between `Parts` and `Vendor`
- `Security_User_roles` — resolves many-to-many between `Security_Users` and `Security_Roles`

**Cross-domain link:** `Garage_Job_order_materials.Material → Parts` is the primary bridge between the Parts/Inventory domain and the Garage/Job Order domain.

**Lookup-heavy design:** 15 tables serve purely as read-only status/type lookups with no children of their own, indicating a well-normalized design for categorical data.

---

*Extracted from AppSheet application export — PiVeRan Auto Parts Dev, App ID: 3df8dccb-b3fb-419c-8b25-c077482253cc*
