# PiVeRan Auto Parts — Application Documentation

> **App Name:** PiVeRan Auto Parts - Dev
> **Version:** 1.000011
> **Generated:** May 15, 2026
> **App ID:** `3df8dccb-b3fb-419c-8b25-c077482253cc`
> **Platform:** AppSheet (Google Sheets backend)
> **Default Folder:** `/appsheet/data/PiVeRanAutoParts-Dev-552943065`

---

## Table of Contents

1. [Application Overview](#1-application-overview)
2. [Data Architecture Summary](#2-data-architecture-summary)
3. [Tables Reference](#3-tables-reference)
   - 3.1 [Vendor & Supplier Tables](#31-vendor--supplier-tables)
   - 3.2 [Parts & Inventory Tables](#32-parts--inventory-tables)
   - 3.3 [Sales & Cash Tables](#33-sales--cash-tables)
   - 3.4 [Purchase Request Tables](#34-purchase-request-tables)
   - 3.5 [Garage / Job Order Tables](#35-garage--job-order-tables)
   - 3.6 [Security & User Tables](#36-security--user-tables)
   - 3.7 [Expense Tables](#37-expense-tables)
   - 3.8 [System / Process Tables](#38-system--process-tables)
4. [Column Definitions & Data Types](#4-column-definitions--data-types)
   - 4.1 [Common Column Patterns](#41-common-column-patterns)
   - 4.2 [Data Type Reference](#42-data-type-reference)
5. [Slices](#5-slices)
6. [UX Views](#6-ux-views)
   - 6.1 [Primary Navigation Views](#61-primary-navigation-views)
   - 6.2 [Dashboard Views](#62-dashboard-views)
   - 6.3 [System-Generated Views](#63-system-generated-views)
7. [Actions](#7-actions)
8. [Update Permissions Reference](#8-update-permissions-reference)

---

## 1. Application Overview

PiVeRan Auto Parts is a comprehensive AppSheet application designed to manage an automotive parts business and associated garage operations. It covers the full business lifecycle — from vendor sourcing and parts inventory through sales, cash management, purchase requests, job orders, and financial reporting.

**Key capabilities at a glance:**

| Category | Count |
|---|---|
| Data Tables | 84 |
| Schema Columns | 934 |
| Data Slices | 21 |
| UX Views | 252 |
| Behavior Actions | 279 |
| Workflow Rules | 0 |
| Format Rules | 0 |

**Application flags:**

| Property | Value |
|---|---|
| Runnable | Yes |
| Deployable | No |
| Personal Use Only | No |
| Function | Other |

---

## 2. Data Architecture Summary

The application is backed primarily by **Google Sheets** (data source: `google`), with a small number of native AppSheet tables used for process state and automation. All data is stored under the app's default folder on Google Drive.

**Source spreadsheets:**

| Spreadsheet File | Purpose |
|---|---|
| `Vendor.gsheet` | Vendors, brands, parts, inventory, cash, purchase requests, expenses |
| `Security_Users.gsheet` | Users, roles, role-view assignments |
| `Garage_Customers.gsheet` | Customers, cars, job orders, labor, mechanics, quality checklists |
| `ProcessStateTables/` | Internal automation state tables (native, hidden) |

All tables share the following conventions:
- `Data locale`: `en-US`
- `Column Order`: starts with `_RowNumber`
- No partitioned files or worksheets
- Image/file capture stored in `_Default`

---

## 3. Tables Reference

### 3.1 Vendor & Supplier Tables

| Table Name | Worksheet | Updates Allowed | Shared | Notes |
|---|---|---|---|---|
| `Vendor` | Vendor | Adds & Updates | Yes | Master supplier/vendor registry |
| `Vendor_contact_numbers` | Vendor_contact_numbers | All Changes | Yes | Vendor phone/contact details |
| `Brands` | Brands | All Changes | Yes | Parts brand catalog |

### 3.2 Parts & Inventory Tables

| Table Name | Worksheet | Updates Allowed | Shared | Notes |
|---|---|---|---|---|
| `Parts` | Parts | Adds & Updates | Yes | Master parts catalog |
| `Parts_photos` | Parts_photos | All Changes | Yes | Photo attachments per part |
| `Parts_price` | Parts_price | Adds & Deletes | Yes | Pricing history per part |
| `Parts_suppliers` | Parts_suppliers | All Changes | Yes | Links parts to their suppliers |
| `Cabinet_Codes` | Cabinet_Codes | All Changes | Yes | Storage location codes |
| `Units` | Units | All Changes | Yes | Unit of measure definitions |
| `Inventory_Log` | Inventory_Log | Adds & Updates | Yes | All stock movement transactions |
| `Inventory_Action` | Inventory_Action | Read Only | Yes | Lookup table for inventory action types |
| `Add_stock_payment_type` | Add_stock_payment_type | Read Only | Yes | Payment type lookup for stock adds |
| `Parts_audit` | Parts_audit | Adds Only | Yes | Inventory audit records |
| `Parts_audit_status` | Parts_audit_status | Read Only | Yes | Audit status lookup |
| `Stocks_Filter` | Stocks_Filter | Updates Only | Yes | Filter state for stock reports |

### 3.3 Sales & Cash Tables

| Table Name | Worksheet | Updates Allowed | Shared | Notes |
|---|---|---|---|---|
| `Cash_Log` | Cash_Log | Adds & Updates | Yes | All cash transactions (sales, expenses, etc.) |
| `Cash_action` | Cash_action | Read Only | Yes | Transaction action type lookup |
| `Cash_Filter` | Cash_Filter | Updates Only | Yes | Filter state for cash reports |
| `Cash_summary` | Cash_summary | Read Only | Yes | Aggregated cash summary view |
| `Sales_report_Filter` | Sales_Filter | Updates Only | Yes | Filter state for sales reports |
| `Sales_summary` | Sales_summary | Read Only | Yes | Aggregated sales summary |
| `Sales_type` | Sales_type | Read Only | Yes | Sales type lookup |

### 3.4 Purchase Request Tables

| Table Name | Worksheet | Updates Allowed | Shared | Notes |
|---|---|---|---|---|
| `Purchase_requests` | Purchase_requests | Adds & Updates | Yes | Purchase request headers |
| `PR_lines` | PR_lines | All Changes | Yes | Line items per purchase request |
| `PR_lines_suppliers` | PR_lines_suppliers | All Changes | Yes | Supplier assignments per PR line |
| `PR_Status` | PR_Status | Read Only | Yes | Purchase request status lookup |
| `PR_lines_Status` | PR_lines_Status | Read Only | Yes | PR line status lookup |
| `PR_comments` | PR_comments | Adds Only | Yes | Comments on purchase requests |
| `PR_line_comments` | PR_line_comments | Adds Only | Yes | Comments on PR line items |
| `PR_Lines_photos` | PR_Lines_photos | All Changes | Yes | Photo attachments on PR lines |
| `X_calc_shipping` | X_calc_shipping | All Changes | Yes | Shipping cost calculator |
| `X_Total_Amount` | X_Total_Amount | — | Yes | Total amount computation helper |

### 3.5 Garage / Job Order Tables

| Table Name | Worksheet | Updates Allowed | Shared | Notes |
|---|---|---|---|---|
| `Garage_Customers` | Customers | All Changes | Yes | Customer master records |
| `Garage_customer_address` | address | All Changes | Yes | Customer address details |
| `Garage_Customer_contact_numbers` | Customer_contact_numbers | All Changes | Yes | Customer contact numbers |
| `Garage_Cars` | Cars | All Changes | Yes | Customer vehicle records |
| `Garage_Car_photos` | Car_photos | All Changes | Yes | Vehicle photo attachments |
| `Garage_Job_Orders` | Job_Orders | All Changes | Yes | Job order headers |
| `Garage_Job_orders_status` | Job_orders_status | Read Only | Yes | Job order status lookup |
| `Garage_Job_order_labors` | Job_order_labors | All Changes | Yes | Labor line items per job order |
| `Garage_Job_order_labor_status` | Job_order_labor_status | Read Only | Yes | Labor status lookup |
| `Garage_Job_order_labor_mechanics` | Job_order_labor_mechanics | All Changes | Yes | Mechanic assignments to labor items |
| `Garage_Job_order_materials` | Job_order_materials | All Changes | Yes | Parts/materials used per job order |
| `Garage_Job_order_materials_status` | *(derived)* | Read Only | Yes | Materials status lookup |
| `Garage_JO_materials_photos` | JO_materials_photos | All Changes | Yes | Photos for job order materials |
| `Garage_JO_materials_comments` | JO_materials_comments | Adds Only | Yes | Comments on job order materials |
| `Garage_JO_labor_photos` | JO_labor_photos | All Changes | Yes | Photos for job order labor |
| `Garage_JO_labor_comments` | JO_labor_comments | Adds Only | Yes | Comments on job order labor |
| `Garage_Labor_Types` | Labor Types | Adds & Updates | Yes | Labor type catalog |
| `Garage_Labor_Prices` | Labor Prices | All Changes | Yes | Labor pricing by type |
| `Garage_Mechanics` | Mechanics | All Changes | Yes | Mechanic staff records |
| `Garage_Mechanics_contact_numbers` | Mechanics_contact_numbers | All Changes | Yes | Mechanic contact numbers |
| `Garage_Skills` | Skills | All Changes | Yes | Skill definitions |
| `Garage_Quality_Checklist` | Quality Checklist | All Changes | Yes | Quality control checklists per job |
| `Garage_Quality_Checklist_Photos` | Quality Checklist Photos | All Changes | Yes | Photos for quality checklists |
| `Garage_Quality_Checklist_Videos` | Quality Checklist Videos | All Changes | Yes | Videos for quality checklists |
| `Garage_Lapor_Type_Quality_Checklist` | Lapor Type Quality Checklist | All Changes | Yes | Quality checklist by labor type |
| `Garage_Report_Monthly_parts_provided_in_house` | Report_Monthly_parts_provided_in_house | All Changes | Yes | Monthly reporting: in-house parts |

### 3.6 Security & User Tables

| Table Name | Worksheet | Updates Allowed | Shared | Notes |
|---|---|---|---|---|
| `Security_Users` | Users | Adds & Updates | Yes | App user accounts |
| `Security_Roles` | Roles | Read Only | Yes | Role definitions |
| `Security_User_roles` | User_roles | All Changes | Yes | User-to-role assignments |
| `Security_Role_views` | Role_views | All Changes | Yes | Views accessible per role |
| `Security_Role_tables` | Role_tables | Read Only | Yes | Tables accessible per role |

### 3.7 Expense Tables

| Table Name | Worksheet | Updates Allowed | Shared | Notes |
|---|---|---|---|---|
| `Expense_Type` | Expense_Type | Read Only | Yes | Expense category lookup |
| `Operating_Expense_type` | Operating_Expense_type | Read Only | Yes | Operating expense category lookup |

### 3.8 System / Process Tables

These tables are **hidden** (`Visible: NEVER`) and are used internally by AppSheet automation processes. They are native (non-Google Sheets) data sources.

| Table Name | Purpose |
|---|---|
| `Process for UpdateOnLabor Process Table` | Automation process state for labor updates |
| `Target Date Updated Output` | Output from the "Target Date Updated" automation step |
| `Add Comment to labor Target Date Output` | Output from the "Add Comment to Labor Target Date" step |
| `_Per User Settings` | Per-user app configuration (native, hidden, updates only) |

---

## 4. Column Definitions & Data Types

### 4.1 Common Column Patterns

Most tables in the application share a consistent set of standard columns for tracking and auditing. These columns are typically **hidden** in forms but stored in the backing sheet.

| Column Name | Type | Description | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Spreadsheet row number | System-defined, read-only, fixed |
| `ID` | Text | Unique record identifier | Key column; initial value: `UNIQUEID()` |
| `Last_update` | ChangeTimestamp | Timestamp of last modification | Auto-updated on any change |
| `Last_updated_by` | Name / Email | Email of last editor | Initial value: `=USEREMAIL()`; reset on edit |
| `Created_date` | DateTime | Record creation timestamp | Initial value: `=NOW()` |
| `Created_by` | Name / Email | Email of record creator | Initial value: `=USEREMAIL()` |

**Virtual relationship columns** (system-defined, read-only) are auto-generated for related tables using `REF_ROWS()` formulas. For example, on the `Vendor` table:

- `Related Inventory_Logs` → `REF_ROWS("Inventory_Log", "Vendor_ID")`
- `Related Parts_suppliers` → `REF_ROWS("Parts_suppliers", "Supplier_ID")`
- `Related Vendor_contact_numbers` → `REF_ROWS("Vendor_contact_numbers", "Vendor_ID")`

### 4.2 Data Type Reference

The application uses the following AppSheet data types:

| Type | Description | Usage Examples |
|---|---|---|
| `Text` | Plain text string | IDs, names, codes |
| `LongText` | Multi-line text | Comments, descriptions |
| `Number` | Numeric value (with thousands separator) | Quantities, counts |
| `Price` | Currency (₱ Philippine Peso, 2 decimal places) | Unit price, total price, discount |
| `Percent` | Percentage value | Profit margins, in-house ratios |
| `Date` | Calendar date | Due dates, audit dates |
| `DateTime` | Date and time | Transaction timestamps, creation dates |
| `ChangeTimestamp` | Auto-updated timestamp on record change | `Last_update` columns |
| `Email` | Email address | User identifiers |
| `Name` | Text formatted as a person's name | Created/updated by tracking |
| `Ref` | Reference to a row in another table | Foreign key relationships |
| `List` | List of Ref values | One-to-many relationship display |
| `Enum` | Fixed set of values | Status fields, type selectors |
| `Yes/No` | Boolean toggle | Flags such as "Provided In-house", "Include in Total" |
| `Image` | Image file attachment | Part photos, car photos |
| `LatLong` | Geographic coordinates | Location capture (hidden by default) |
| `Show` | Display-only label (no data stored) | Section headings in forms |

**Currency note:** All monetary values use the **Philippine Peso (₱)** with 2 decimal places and thousands separators.

---

## 5. Slices

Slices are filtered views of a source table, exposing only rows that meet a specific condition and/or a specific subset of columns. The app defines **21 slices** across its major tables.

### Key Slices

| Slice Name | Source Table | Row Filter Condition | Update Mode | Purpose |
|---|---|---|---|---|
| `Expenses` | Cash_Log | `[Action_ID] = 3` | Adds & Updates | Shows only expense transactions |
| `Critical_inventory` | Parts | `AND([Current Stocks] <= [Critical_count], [Include in Critical Count])` | Adds & Updates | Parts at or below critical stock level |
| `Add_Stocks` | Inventory_Log | `[Action_ID] = 1` | Adds & Updates | Stock-in (purchase/receiving) transactions |
| `Add_stocks_price_history_RO` | Inventory_Log | `[Action_ID] = 1` | *(Read-only variant)* | Historical view of stock additions |

> **Note:** Slice actions default to `**auto**`, meaning AppSheet automatically determines which add/edit/delete actions apply based on the update mode.

---

## 6. UX Views

The application contains **252 views** organized into primary navigation, dashboards, detail/form pairs, and system-generated supporting views.

### 6.1 Primary Navigation Views

These views appear in the main app navigation menu and are visible to users:

| View Name | View Type | Source / Purpose |
|---|---|---|
| `Parts` | *(list/deck)* | Main parts catalog browser |
| `Critical Parts` | *(list)* | Parts at or below critical stock threshold |
| `Purchase_requests` | *(list)* | Active purchase requests |
| `Gar-Job_Orders_not_completed` | *(list)* | Open job orders |
| `Inventory Log` | *(list)* | Full inventory transaction log |
| `Supplier` | *(list)* | Vendor/supplier directory |
| `Cabinet` | *(list)* | Cabinet and storage code management |
| `All_Purchase_requests` | *(list)* | Complete purchase request history |
| `Security_Users` | *(list)* | User account management |
| `Security_View_management` | *(list)* | Role-view permission management |
| `Active Purchase Requests_Detail` | detail | Detail view for active PRs |
| `Active Purchase Requests_Form` | form | Form for active PR editing |
| `Job_Order_all` | *(list)* | All job orders |
| `Labor Types` | *(list)* | Labor type management |
| `Cash Management` | *(list)* | Cash transaction management |
| `Shipping Calculator` | *(list)* | Shipping cost calculation tool |
| `MyTodaySale` | *(list)* | Today's sales for the current user |
| `MyCollectibles` | *(list)* | Collectibles / receivables for current user |
| `Collectibles` | *(list)* | All collectibles |
| `Damages and Lost` | *(list)* | Damage and lost stock records |
| `Payables` | *(list)* | Accounts payable |
| `Parts Need Inventory` | *(list)* | Parts requiring restocking |
| `Parts_no_price_View` | *(list)* | Parts missing price information |
| `Provided In-house` | *(list)* | Job materials provided in-house |

### 6.2 Dashboard Views

| View Name | Purpose |
|---|---|
| `Income Statement` | Financial income statement summary |
| `Sales Dashboard` | Sales performance metrics and charts |
| `Cash Dashboard` | Cash flow overview |
| `Inventory Dashboard` | Stock level overview |

### 6.3 System-Generated Views

For every editable table, AppSheet automatically generates companion views. These follow a consistent naming convention:

| Suffix | View Type | Purpose |
|---|---|---|
| `_Detail` | detail | Record detail display with slideshow image support |
| `_Form` | form | Add/edit record form |
| `_Inline` | table | Compact table view for nested display |

**Example — Parts Audit views:**

- `Parts_audit_Detail` — Shows: Part, Part Current Stock, Count, Status, Comment, Last Audit; Header: Last Audit Status
- `Parts_audit_Form` — Columns: Part, Part Last Stock, Count, Status, Comment
- `Parts_audit_Inline` — Columns: Status, Last Audit; sorted by `Last_update` descending

**Parts Photos view** — Uses a **card layout** with square image tiles (180px height), displaying the photo with a gradient overlay and title label. This is a custom owner-created view (not system-generated).

**Not_provided_in_house_list** — Owner-created table view showing materials not sourced in-house, with columns: Material, Comment, Job Order, Date, Price, Quantity, Total Price, Discount, Final Price; sorted by `Created_date` descending.

---

## 7. Actions

The application defines **279 actions**, the majority of which are chart navigation actions that link from a record in a data table to a specific report or chart view.

### Chart Data Navigation Actions

These actions use `NAVIGATE_APP` to route from a source table record to a reporting/chart view. They fire conditionally based on the current view context (`CONTEXT("View")`), are displayed prominently, do not bulk-apply, and do not modify data.

| Action Name | Source Table | Target Table / View | Trigger View |
|---|---|---|---|
| Chart Data for Expense_Operational_report_Breakdown | Cash_Log | Operating_expenses | `Expense_Operational_report_Breakdown` |
| Chart Data for Expense_report_Breakdown | Cash_Log | Expenses | `Expense_report_Breakdown` |
| Chart Data for Profit_by_product_price | Inventory_Log | Sales_for_filtered_report | `Profit_by_product_price` |
| Chart Data for Sales_by_date | Inventory_Log | Sales_for_filtered_report | `Sales_by_date` |
| Chart Data for Sales_by_Month | Inventory_Log | Sales_for_filtered_report | `Sales_by_Month` |
| Chart Data for Sales_by_Month_Quantity | Inventory_Log | Sales_for_filtered_report | `Sales_by_Month_Quantity` |
| Chart Data for Sales_by_product_count | Inventory_Log | Sales_for_filtered_report | `Sales_by_product_count` |
| Chart Data for Sales_by_product_price | Inventory_Log | Sales_for_filtered_report | `Sales_by_product_price` |
| Chart Data for Sales_by_product_Profit_percentage | Inventory_Log | Sales_for_filtered_report | `Sales_by_product_Profit_percentage` |
| Chart Data for Stocks_by_Month | Inventory_Log | Add_Stocks | `Stocks_by_Month` |
| Chart Data for Stocks_by_Supplier_filtered | Inventory_Log | Add_Stocks_for_filtered_report | `Stocks_by_Supplier_filtered` |

### Common Action Properties

All chart navigation actions share these attributes:

| Property | Value |
|---|---|
| Action type | `NAVIGATE_APP` |
| Bulk action | No |
| Modifies data | No |
| Needs confirmation | No |
| Prominence | Display Prominently |
| Action order | 1 |
| Display name | Data |
| Disable automatic updates | No |
| Applies to whole table | Yes |
| Visibility | Always |

---

## 8. Update Permissions Reference

The following update modes are used across tables. Understanding these is important when determining what operations are available through the app interface.

| Update Mode | Meaning |
|---|---|
| `ALL_CHANGES` | Full CRUD — add, edit, and delete records |
| `ADDS_AND_UPDATES` | Can add new records and edit existing ones; no deletion |
| `ADDS_ONLY` | Insert new records only; cannot edit or delete |
| `ADDS_AND_DELETES` | Can add and delete, but not edit existing records |
| `UPDATES_ONLY` | Can edit existing records only; no add or delete |
| `READ_ONLY` | View only; no modifications permitted |

### Quick Reference by Domain

| Domain | Typical Mode | Rationale |
|---|---|---|
| Lookup / reference tables (statuses, types) | `READ_ONLY` | Controlled by admin; not edited in app |
| Audit logs, comments | `ADDS_ONLY` | Immutable records for traceability |
| Filter / settings tables | `UPDATES_ONLY` | State-only; no new rows needed |
| Core transactional tables | `ADDS_AND_UPDATES` | Normal business operations |
| Catalog / master data tables | `ALL_CHANGES` | Full management by authorized users |
| Price history | `ADDS_AND_DELETES` | New prices added; old prices can be removed |

---

*Documentation generated from AppSheet application export — PiVeRan Auto Parts Dev, App ID: 3df8dccb-b3fb-419c-8b25-c077482253cc*
