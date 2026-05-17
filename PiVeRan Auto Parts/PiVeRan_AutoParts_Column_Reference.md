# PiVeRan Auto Parts — Complete Column Reference

> **Source:** Extracted from AppSheet application export (40,549 lines)
> **App ID:** `3df8dccb-b3fb-419c-8b25-c077482253cc`
> **Coverage:** All tables and columns with data types, key flags, foreign keys, formulas, and defaults

---

## Column Flag Legend

| Flag | Meaning |
|---|---|
| `PK` | Primary key column |
| `FK → TableName` | Foreign key referencing another table |
| `Required` | Value must be provided |
| `Hidden` | Hidden from users in forms and views |
| `Read-only` | Cannot be edited by users |
| `Virtual` | Computed column, not stored in the sheet |

---

## Table of Contents

- [🔍 Lookup & Reference Tables](#lookup-reference-tables)
  - [Brands](#brands)
  - [Cabinet_Codes](#cabinet_codes)
  - [Units](#units)
  - [Sales_type](#sales_type)
  - [Cash_action](#cash_action)
  - [Inventory_Action](#inventory_action)
  - [Add_stock_payment_type](#add_stock_payment_type)
  - [Expense_Type](#expense_type)
  - [Operating_Expense_type](#operating_expense_type)
  - [PR_Status](#pr_status)
  - [PR_lines_Status](#pr_lines_status)
  - [Parts_audit_status](#parts_audit_status)
  - [Garage_Job_orders_status](#garage_job_orders_status)
  - [Garage_Job_order_labor_status](#garage_job_order_labor_status)
  - [Garage_Job_order_materials_status](#garage_job_order_materials_status)
- [🏭 Vendor & Supplier](#vendor-supplier)
  - [Vendor](#vendor)
  - [Vendor_contact_numbers](#vendor_contact_numbers)
- [📦 Parts & Inventory](#parts-inventory)
  - [Parts](#parts)
  - [Parts_photos](#parts_photos)
  - [Parts_price](#parts_price)
  - [Parts_suppliers](#parts_suppliers)
  - [Parts_audit](#parts_audit)
  - [Inventory_Log](#inventory_log)
  - [Stocks_Filter](#stocks_filter)
- [💰 Cash & Sales](#cash-sales)
  - [Cash_Log](#cash_log)
  - [Cash_Filter](#cash_filter)
  - [Cash_summary](#cash_summary)
  - [Sales_report_Filter](#sales_report_filter)
  - [Sales_summary](#sales_summary)
- [📋 Purchase Requests](#purchase-requests)
  - [Purchase_requests](#purchase_requests)
  - [PR_lines](#pr_lines)
  - [PR_lines_suppliers](#pr_lines_suppliers)
  - [PR_comments](#pr_comments)
  - [PR_line_comments](#pr_line_comments)
  - [PR_Lines_photos](#pr_lines_photos)
  - [X_calc_shipping](#x_calc_shipping)
  - [X_Total_Amount](#x_total_amount)
- [🔐 Security & Access Control](#security-access-control)
  - [Security_Users](#security_users)
  - [Security_Roles](#security_roles)
  - [Security_User_roles](#security_user_roles)
  - [Security_Role_views](#security_role_views)
  - [Security_Role_tables](#security_role_tables)
- [🔧 Garage — Customers & Vehicles](#garage-customers-vehicles)
  - [Garage_Customers](#garage_customers)
  - [Garage_customer_address](#garage_customer_address)
  - [Garage_Customer_contact_numbers](#garage_customer_contact_numbers)
  - [Garage_Cars](#garage_cars)
  - [Garage_Car_photos](#garage_car_photos)
- [🔧 Garage — Staff & Labor](#garage-staff-labor)
  - [Garage_Labor_Types](#garage_labor_types)
  - [Garage_Labor_Prices](#garage_labor_prices)
  - [Garage_Mechanics](#garage_mechanics)
  - [Garage_Mechanics_contact_numbers](#garage_mechanics_contact_numbers)
  - [Garage_Skills](#garage_skills)
  - [Garage_Cashiers](#garage_cashiers)
- [🔧 Garage — Job Orders](#garage-job-orders)
  - [Garage_Job_Orders](#garage_job_orders)
  - [Garage_Job_order_photos](#garage_job_order_photos)
  - [Garage_Job_order_comments](#garage_job_order_comments)
  - [Garage_Job_order_payments](#garage_job_order_payments)
  - [Garage_Job_order_labors](#garage_job_order_labors)
  - [Garage_Job_order_labor_mechanics](#garage_job_order_labor_mechanics)
  - [Garage_JO_labor_photos](#garage_jo_labor_photos)
  - [Garage_JO_labor_comments](#garage_jo_labor_comments)
  - [Garage_Job_order_materials](#garage_job_order_materials)
  - [Garage_JO_materials_photos](#garage_jo_materials_photos)
  - [Garage_JO_materials_comments](#garage_jo_materials_comments)
- [✅ Garage — Quality Control](#garage-quality-control)
  - [Garage_Quality_Checklist](#garage_quality_checklist)
  - [Garage_Quality_Checklist_Photos](#garage_quality_checklist_photos)
  - [Garage_Quality_Checklist_Videos](#garage_quality_checklist_videos)
  - [Garage_Lapor_Type_Quality_Checklist](#garage_lapor_type_quality_checklist)
  - [Garage_Report_Monthly_parts_provided_in_house](#garage_report_monthly_parts_provided_in_house)
- [⚙️ System](#system)
  - [_Per_User_Settings](#_per_user_settings)

---

## 🔍 Lookup & Reference Tables

### Brands

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | — | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Brand Name` | Name |  |  |
| `Related P arts` | List | Read-only, Virtual | `REF_ROWS("P arts", "Br and_ID")` |

### Cabinet_Codes

**6 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Cabinet Code` | Text |  |  |
| `Image` | Image |  |  |
| `Description` | — |  |  |
| `Related P arts` | — | Read-only, Virtual | `REF_ROWS("P arts", "Cabinet_code_ID")` |

### Units

**3 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Number | PK |  |
| `Related Inv entory_Logs` | List | Read-only, Virtual | `REF_ROWS("Inv entory_Log", "Unit_ID")` |

### Sales_type

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Number | PK, Hidden, Read-only |  |
| `Type` | Text | Read-only |  |
| `Related Inv entory_Logs` | List | Read-only, Virtual | `REF_ROWS("Inv entory_Log", "Sales_T ype")` |

### Cash_action

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | — | PK |  |
| `Action` | Text |  |  |
| `Related Cash_Logs` | List | Read-only, Virtual | `REF_ROWS("Cash_Log", " Action_ID")` |

### Inventory_Action

**5 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Number | PK |  |
| `Action Name` | Name |  |  |
| `Add_Minus` | Number | Read-only |  |
| `Related Inv entory_Logs` | List | Read-only, Virtual | `REF_ROWS("Inv entory_Log", " Action_ID")` |

### Add_stock_payment_type

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Number | PK, Hidden, Read-only |  |
| `Type` | Text | Read-only |  |
| `Related Inv entory_Logs` | List | Read-only, Virtual | `REF_ROWS("Inv entory_Log", " Add_st ock_P ayment_T ype")` |

### Expense_Type

**5 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Number | PK, Hidden |  |
| `Expense Type` | Text | Read-only |  |
| `Description` | — | Read-only |  |
| `Related Cash_Logs` | List | Read-only, Virtual | `REF_ROWS("Cash_Log", "Expense Type")` |

### Operating_Expense_type

**5 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | — | Hidden, Read-only |  |
| `ID` | Number | PK |  |
| `Oper ating Expense Type` | Text |  |  |
| `Description` | — |  |  |
| `Related Cash_Logs` | List | Read-only, Virtual | `REF_ROWS("Cash_Log", "Oper ating Expense Type")` |

### PR_Status

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Status` | Text |  |  |
| `Related Pur chase_r equests` | List | Read-only, Virtual | `REF_ROWS("Pur chase_r equests", "Status")` |

### PR_lines_Status

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Status` | Text |  |  |
| `Related PR_lines` | List | Read-only, Virtual | `REF_ROWS("PR_lines", "Status")` |

### Parts_audit_status

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Number | PK |  |
| `Status` | Text |  |  |
| `Related P arts_audits` | List | Read-only, Virtual | `REF_ROWS("P arts_audit", "Status")` |

### Garage_Job_orders_status

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK |  |
| `Status` | Text |  |  |
| `Related Gar age_Job_Or ders` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_Or ders", "Status")` |

### Garage_Job_order_labor_status

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | — | PK, Hidden |  |
| `Status` | Text |  |  |
| `Related Gar age_Job_or der_labors` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_labors", "Status")` |

### Garage_Job_order_materials_status

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Number | PK, Hidden |  |
| `Status` | Text |  |  |
| `Related Gar age_Job_or der_materials` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_materials", "Status")` |

---

## 🏭 Vendor & Supplier

### Vendor

**18 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | — | PK, Hidden |  |
| `Vendor Name` | Name |  |  |
| `Addr ess` | — |  |  |
| `Contact Number` | Phone |  |  |
| `Link` | — |  |  |
| `Comments` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Name | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Name | Hidden |  |
| `Related Inv entory_Logs` | List | Read-only, Virtual | `REF_ROWS("Inv entory_Log", "V endor_ID")` |
| `Related P arts_suppliers` | List | Read-only, Virtual | `REF_ROWS("P arts_suppliers", "Supplier_ID")` |
| `Related V endor_contact_numbers` | List | Read-only, Virtual | `REF_ROWS("V endor_contact_numbers", "V endor_ID")` |
| `Vendor_label` | Text | Hidden, Read-only, Virtual | `=[Vendor Name]` |
| `Related PR_lines_suppliers` | List | Read-only, Virtual | `REF_ROWS("PR_lines_suppliers", "V endor_ID")` |
| `Related PR_lines` | List | Read-only, Virtual | `REF_ROWS("PR_lines", "Supplier_ID")` |
| `Related P arts` | List | Read-only, Virtual | `REF_ROWS("P arts", "Latest Supplier ")` |

### Vendor_contact_numbers

**10 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Vendor_ID` | Ref | FK → Vendor |  |
| `Number` | Phone |  |  |
| `Label` | Text |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Name | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Name | Hidden |  |
| `Label_number` | Text | Read-only, Virtual | `=Concatenate([Number] , " - ", [Label])` |

---

## 📦 Parts & Inventory

### Parts

**42 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Part Name` | Name |  |  |
| `Brand_ID` | Ref | FK → Brands |  |
| `Part Number` | Text |  |  |
| `Part Code` | Text |  |  |
| `Description` | — |  |  |
| `Cabinet_code_ID` | Ref | FK → Cabinet_Codes |  |
| `Profile Phot o` | Image |  |  |
| `Comment` | — |  |  |
| `Critical_count` | Number |  |  |
| `Include in Critical Count` | Yes/No |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Name | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Name | Hidden |  |
| `Table_name` | Name | Hidden, Read-only |  |
| `Related Inv entory_Logs` | List | Read-only, Virtual | `REF_ROWS("Inv entory_Log", "P art_ID")` |
| `Related P arts_phot os` | List | Read-only, Virtual | `REF_ROWS("P arts_phot os", "P art_ID")` |
| `Related P arts_prices` | List | Read-only, Virtual | `REF_ROWS("P arts_price ", "Part_ID")` |
| `Price fr om diff erent suppliers` | List | Read-only, Virtual | `REF_ROWS("P arts_suppliers", "P art_ID")` |
| `Parts_Label` | Name | Read-only, Virtual |  |
| `Curr ent St ocks` | Decimal | Read-only, Virtual |  |
| `Most_r ecent_price` | Price | Read-only, Virtual |  |
| `Curr ent_price_st ock` | Text | Read-only, Virtual | `=concatenate([Most_r ecent_price], " (",[Curr ent St ocks], ")")` |
| `Sales Hist ory` | List | Read-only, Virtual | `=FILTER("Sales", [P art_ID] = [_THISROW ].[ID])` |
| `Curr ent_st ock_T ext` | Text | Read-only, Virtual |  |
| `Price fr om st ock hist ory` | List | Read-only, Virtual | `=REF_ROWS(" Add_st ocks_price_hist ory_RO", "P art_ID")` |
| `Last St ock Price` | — | Read-only, Virtual |  |
| `Total_amount_st ock_price` | Price | Read-only, Virtual | `=[Last St ock Price]*[Curr ent St ocks]` |
| `Total_amount_pr ojected_Price` | Price | Read-only, Virtual | `=[Most_r ecent_price]*[Curr ent St ocks]` |
| `Related PR_lines` | List | Read-only, Virtual | `REF_ROWS("PR_lines", "P art_ID")` |
| `Related P arts_audits` | List | Read-only, Virtual | `REF_ROWS("P arts_audit", "P art")5/15/26, 3:55 PM Application Documentation` |
| `Last A udit` | Text | Read-only, Virtual |  |
| `Last A udit Status` | Text | Read-only, Virtual |  |
| `Last A udit Date` | DateTime | Read-only, Virtual |  |
| `Days Last A udit` | Number | Read-only, Virtual |  |
| `Last A udit Not Good` | Yes/No | Read-only, Virtual |  |
| `Related Gar age_Job_or der_materials` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_materials", "Material")` |
| `Latest Pr ofit Mar gin` | Percent | Read-only, Virtual | `=([Most_r ecent_price]-[Last St ock Price])/[Last St ock Price]` |
| `Latest Pr ofit Amount` | Price | Read-only, Virtual | `=[Most_r ecent_price]-[Last St ock Price]` |
| `Latest Supplier` | Ref | FK → Vendor, Read-only, Virtual |  |

### Parts_photos

**6 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | — | PK, Hidden |  |
| `Phot o` | Image |  |  |
| `Part_ID` | Ref | FK → Parts |  |
| `Date` | DateTime |  |  |
| `Notes` | — |  |  |

### Parts_price

**11 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Date` | DateTime |  |  |
| `Part_ID` | Ref | FK → Parts |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Name | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Name | Hidden |  |
| `Last Supplier Price` | Price | Read-only, Virtual |  |
| `Historical St ock Price` | List | Read-only, Virtual |  |

### Parts_suppliers

**12 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Part_ID` | — | FK → Parts |  |
| `Supplier_ID` | Ref | FK → Vendor |  |
| `Price` | Price |  |  |
| `Last Update` | DateTime |  | `=NOW()` |
| `Comment` | — |  |  |
| `Link` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Name | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Name | Hidden |  |

### Parts_audit

**14 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Part` | Ref | FK → Parts |  |
| `Count` | Decimal |  |  |
| `Status` | Ref | FK → Parts_audit_status |  |
| `Part Curr ent St ock` | Decimal |  | `=[Part].[Curr ent St ocks]` |
| `Comment` | — |  |  |
| `Last_update` | — | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Part Last St ock_X` | Decimal | Read-only, Virtual | `=[Part].[Curr ent St ocks]5/15/26, 3:55 PM Application Documentation` |
| `Last A udit` | Text | Read-only, Virtual | `=CONCA TEN ATE(TEXT([Last_update]), "(",[Last_updated_b y],")")` |
| `Last A udit Status` | Text | Read-only, Virtual |  |

### Inventory_Log

**37 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Date` | DateTime |  |  |
| `Vendor_ID` | Ref | FK → Vendor |  |
| `Part_ID` | Ref | FK → Parts |  |
| `Action_ID` | Ref | FK → Inv entory_Action |  |
| `Unit_ID` | Ref | FK → Units |  |
| `Quantity` | Decimal |  |  |
| `Unit Price` | Price |  |  |
| `Total Price` | Price |  |  |
| `Comments` | — |  |  |
| `Last St ock Price` | Price |  |  |
| `Estimate Pr ofit` | Price |  | `=IF([Action_ID]=2,[T otal Price]-([Last St ock Price]*[Quantity]),0)` |
| `Date_T rimed` | Date |  | `=Date([Date])` |
| `YearMonth` | Text | Hidden, Read-only |  |
| `YearQuar ter` | Text | Hidden, Read-only |  |
| `Year` | Number | Hidden, Read-only |  |
| `Sales_T ype` | Ref | FK → Sales_type |  |
| `Add_st ock_P ayment_T ype` | Ref | FK → Add_st ock_pa yment_type |  |
| `Payable_due_date` | Date |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | — | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Name | Hidden |  |
| `Add_st ock_link` | — |  |  |
| `Total St ock v alue` | Price | Read-only |  |
| `Label` | Text | Read-only, Virtual | `=Concatenate([P art_ID].[P arts_Label], "-",[Date])` |
| `Date_T rimed2` | Date | Read-only, Virtual | `=Date([Date])` |
| `Quantity_for_Count` | Decimal | Hidden, Read-only, Virtual | `=[Quantity]*[Action_ID].[Add_Minus]` |
| `Discount` | Price | Read-only, Virtual |  |
| `Part_Curr ent_St ock` | Number | Read-only, Virtual | `=[Part_ID].[Curr ent St ocks]` |
| `Year_Month` | Text | Read-only, Virtual |  |
| `Profit_t o_sales_per centage` | Decimal | Read-only, Virtual |  |
| `Part_most_r ecent_price` | — | Read-only, Virtual | `=[Part_ID].[Most_r ecent_price]` |
| `Computed_unit_price` | Price | Read-only, Virtual |  |
| `Created By` | Name | Read-only, Virtual |  |
| `Dummy` | Number | Hidden, Read-only, Virtual | `=1` |

### Stocks_Filter

**3 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | PK, Hidden, Read-only |  |
| `Start_date` | Date |  |  |
| `End_date` | Date |  |  |

---

## 💰 Cash & Sales

### Cash_Log

**16 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK |  |
| `Date_time` | DateTime |  |  |
| `Date` | Date | Hidden | `=Date([Date_time])` |
| `YearMonth` | Text | Read-only |  |
| `YearQuar ter` | Text | Read-only |  |
| `Year` | Number | Read-only |  |
| `Action_ID` | Ref | FK → Cash_action |  |
| `Amount` | — |  |  |
| `Comment` | — |  |  |
| `Expense Type` | Ref | FK → Expense_T ype |  |
| `Oper ating Expense Type` | Ref | FK → Oper ating_Expense_type |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Name | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Text | Hidden |  |

### Cash_Filter

**3 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | PK, Hidden, Read-only |  |
| `Start_date` | Date |  |  |
| `End_date` | Date |  |  |

### Cash_summary

**3 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | PK, Hidden, Read-only |  |
| `Data` | Text | Read-only |  |
| `Value` | Price | Read-only |  |

### Sales_report_Filter

**4 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | PK, Hidden, Read-only |  |
| `Start_date` | Date |  |  |
| `End_date` | Date |  |  |
| `Part_name` | Name |  |  |

### Sales_summary

**3 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `Data` | Text | PK |  |
| `Value` | Decimal |  |  |

---

## 📋 Purchase Requests

### Purchase_requests

**18 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Purchase_r equest_number` | Text | Read-only |  |
| `Date` | — |  |  |
| `Status` | Ref | FK → PR_Status |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Name | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Name | Hidden |  |
| `Label` | Text |  |  |
| `Related PR_lines` | List | Read-only, Virtual | `REF_ROWS("PR_lines", "Pur chase_r equest_ID")` |
| `Total_Price` | Price | Read-only, Virtual |  |
| `Related PR_comments` | List | Read-only, Virtual | `REF_ROWS("PR_comments", "PR_ID")` |
| `PR_No_Label` | — | Read-only, Virtual | `=CONCA TEN ATE([Pur chase_r equest_number], " (",[Label], ")")` |
| `Pending P ayment` | Price | Read-only, Virtual |  |
| `Total Target Price` | Price | Read-only, Virtual |  |
| `Total Pr ojected Pr ofit` | Price | Read-only, Virtual |  |

### PR_lines

**27 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Purchase_r equest_ID` | Ref | FK → Pur chase_r equests |  |
| `Part_ID` | Ref | FK → Parts |  |
| `Quantity` | Number |  |  |
| `Total_price` | Price |  |  |
| `Date` | DateTime |  |  |
| `Status` | Ref | FK → PR_lines_Status |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Name | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Name | Hidden |  |
| `Unit_price` | Price |  |  |
| `Target Price` | Price |  |  |
| `Total Target Price` | Price |  | `=[Target Price]*[Quantity]` |
| `Projected Pr ofit` | Price |  |  |
| `Link` | — |  |  |
| `Supplier_ID` | Ref | FK → Vendor, Read-only, Virtual | `REF_ROWS("PR_lines_suppliers", "PR_Lines_ID")` |
| `Part_Part_number` | Text | Read-only, Virtual | `=[Part_ID].[P art Number]` |
| `Parts_price_fr om_diff erent_Suppliers` | — | Read-only, Virtual | `=[Part_ID].[Price fr om diff erent suppliers]` |
| `Part_ID_Phot o` | Image | Read-only, Virtual | `=[Part_ID].[Pr ofile Phot o]` |
| `Quantity_unit_price` | Text | Read-only, Virtual | `=CONCA TEN ATE(TEXT([ Unit_price]), "(",[Quantity], ")")` |
| `Total_price_status` | Text | Read-only, Virtual | `=CONCA TEN ATE(TEXT([T otal_price]), " - ",[Status].[Status])` |
| `Related PR_line_comments` | List | Read-only, Virtual | `REF_ROWS("PR_line_comments", "PR_Line_ID")` |
| `For_Label` | Name | Read-only, Virtual | `=[Part_ID].[P art Name]` |
| `Related PR_Lines_phot os` | List | Read-only, Virtual | `REF_ROWS("PR_Lines_phot os", "PR_Line_ID")` |

### PR_lines_suppliers

**11 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `PR_Lines_ID` | Ref | FK → PR_lines |  |
| `Vendor_ID` | Ref | FK → Vendor |  |
| `Link` | — |  |  |
| `Price` | Price |  |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Name | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Name | Hidden |  |

### PR_comments

**8 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | — | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `PR_ID` | Ref | FK → Pur chase_r equests |  |
| `Comment` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden | `=USEREM AIL()` |
| `Created_date` | DateTime |  |  |
| `Created_b y` | Email |  |  |
| `Created_date_b y` | Text | Read-only, Virtual | `=concatenate(text([Cr eated_date]), " (",[Cr eated_b y],")")` |

### PR_line_comments

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `PR_Line_ID` | Ref | FK → PR_lines |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden | `=USEREM AIL()` |
| `Created_date` | DateTime |  |  |
| `Created_b y` | — |  |  |
| `Created_date_b y` | Text | Read-only, Virtual | `=CONCA TEN ATE(TEXT([Cr eated_date]), " (",[Cr eated_b y],")")` |

### PR_Lines_photos

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `PR_Line_ID` | Ref | FK → PR_lines |  |
| `Phot o` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden | `=USEREM AIL()` |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Comment` | — |  |  |

### X_calc_shipping

**8 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Item Number` | Number |  |  |
| `Price` | Price |  |  |
| `Quantity` | Number |  |  |
| `Total Price` | Price | Read-only, Virtual | `=[Price]*[Quantity]` |
| `Shipping F ee` | Price | Read-only, Virtual |  |
| `Adjusted Total Price` | Price | Read-only, Virtual | `=[Shipping F ee]+[T otal Price]` |

### X_Total_Amount

**3 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | PK, Hidden, Read-only |  |
| `Total Amount` | Price |  |  |
| `Total Shipping` | Price | Read-only, Virtual |  |

---

## 🔐 Security & Access Control

### Security_Users

**13 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Email` | Email |  |  |
| `First Name` | Name |  |  |
| `Last Name` | Name |  |  |
| `Nick Name` | Name |  |  |
| `Phot o` | Image | Hidden |  |
| `Last_updated_b y` | Email | Hidden | `=USEREM AIL()` |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Full Name` | Name | Read-only, Virtual | `CONCA TEN ATE([First Name], " ",[Last Name])` |
| `Related Security_User_r oles` | List | Read-only, Virtual | `REF_ROWS("Security_User_r oles", "User ")` |
| `Full Name and Email` | Text | Read-only, Virtual | `=CONCA TEN ATE([F ull Name], "(",[Email], ")")` |

### Security_Roles

**7 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Number | PK, Hidden |  |
| `Role` | Text |  |  |
| `Description` | — |  |  |
| `Related Security_User_r oles` | List | Read-only, Virtual | `REF_ROWS("Security_User_r oles", "Role ")` |
| `Related Security_Role_views` | List | Read-only, Virtual | `REF_ROWS("Security_Role_views", "Role ")` |
| `Related Security_Role_tables` | List | Read-only, Virtual | `REF_ROWS("Security_Role_tables", "Role ")` |

### Security_User_roles

**8 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `User` | Ref | FK → Security_Users |  |
| `Role` | Ref | FK → Security_Roles |  |
| `Last_update` | ChangeTimestamp |  |  |
| `Last_updated_b y` | Email |  | `=USEREM AIL()` |
| `Created_date` | DateTime |  |  |
| `Created_b y` | Email |  |  |

### Security_Role_views

**8 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Role` | — | FK → Security_Roles |  |
| `View` | Text |  |  |
| `Last_update` | ChangeTimestamp |  |  |
| `Last_updated_b y` | Email |  | `=USEREM AIL()` |
| `Created_date` | — |  |  |
| `Created_b y` | Email |  |  |

### Security_Role_tables

**5 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Role` | Ref | FK → Security_Roles |  |
| `Table` | — |  |  |
| `Access Method` | Text |  |  |

---

## 🔧 Garage — Customers & Vehicles

### Garage_Customers

**19 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Last Name` | Name |  |  |
| `Middle Name` | Name |  |  |
| `Nick Name` | Name |  |  |
| `Suffix` | Text |  |  |
| `Birthda y` | Date |  |  |
| `Primar y Contact Number` | Phone |  |  |
| `Email` | Email |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | — | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `_ComputedName` | Name | Read-only, Virtual | `CONCA TEN ATE([First Name], " ",[Middle Name], " ",[Last Name])` |
| `ComputedName` | Name | Read-only, Virtual |  |
| `Related Gar age_cust omer_addr ess` | — | Read-only, Virtual | `REF_ROWS("Gar age_cust omer_addr ess", "Cust omer ")` |
| `Related Gar age_Cust omer_contact_numbers` | List | Read-only, Virtual | `REF_ROWS("Gar age_Cust omer_contact_numbers", "Cust omer ")` |
| `Related Gar age_Cars` | List | Read-only, Virtual | `REF_ROWS("Gar age_Cars", "Primar y Owner ")` |
| `Related Gar age_Job_Or ders` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_Or ders", "Primar y Contact")5/15/26, 3:55 PM Application ` |

### Garage_customer_address

**14 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Cust omer` | Ref | FK → Gar age_Cust omers |  |
| `Street` | Text |  |  |
| `Village` | Text |  |  |
| `Baranga y` | Text |  |  |
| `City` | Text |  |  |
| `Province` | Text |  |  |
| `Zip Code` | Text |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Computed_addr esss` | Text | Read-only, Virtual |  |

### Garage_Customer_contact_numbers

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Cust omer` | Ref | FK → Gar age_Cust omers |  |
| `Contact number` | Phone |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Number` | Text | Read-only, Virtual | `=TEXT([Contact number])` |

### Garage_Cars

**16 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Mak e` | Text |  |  |
| `Model` | Text |  |  |
| `Year` | Text |  |  |
| `Color` | Text |  |  |
| `Plate Number` | Text |  |  |
| `Profile Phot o` | Image |  |  |
| `Primar y Owner` | Ref | FK → Gar age_Cust omers |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Related Gar age_Job_Or ders` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_Or ders", "Car ")` |
| `Related Gar age_Car_phot os` | List | Read-only, Virtual | `REF_ROWS("Gar age_Car_phot os", "Car ")` |
| `Plate_no_Mak e_model_color` | Text | Read-only, Virtual |  |

### Garage_Car_photos

**8 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Car` | Ref | FK → Gar age_Cars |  |
| `Phot o` | Image |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |

---

## 🔧 Garage — Staff & Labor

### Garage_Labor_Types

**11 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | — | PK, Hidden |  |
| `Name` | Text |  |  |
| `Description` | — |  |  |
| `Price` | Price |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Related Gar age_Labor Prices` | List | Read-only, Virtual | `REF_ROWS("Gar age_Labor Prices", "Labor Type")` |
| `Related Gar age_Job_or der_labors` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_labors", "Labor ")` |
| `Related Gar age_Lapor_T ype_Quality_Checklists` | List | Read-only, Virtual | `REF_ROWS("Gar age_Lapor_T ype_Quality_Checklist", "Labor Type")` |

### Garage_Labor_Prices

**8 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Labor Type` | Ref | FK → Gar age_Labor |  |
| `Price` | Price |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |

### Garage_Mechanics

**13 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `First Name` | Name |  |  |
| `Last Name` | Name |  |  |
| `Nick Name` | Name |  |  |
| `Primar y Contact Number` | Phone |  |  |
| `Last_update` | — | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `_ComputedName` | Name | Read-only, Virtual | `CONCA TEN ATE([First Name], " ",[Last Name])` |
| `Related Gar age_Mechanics_contact_numbers` | List | Read-only, Virtual | `REF_ROWS("Gar age_Mechanics_contact_numbers", "Mechanic ")` |
| `Related Gar age_Job_or der_labor_mechanics` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_labor_mechanics", "Mechanic ")` |

### Garage_Mechanics_contact_numbers

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Mechanic` | Ref | FK → Gar age_Mechanics |  |
| `Contact Number` | Phone |  |  |
| `Label` | Text |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |

### Garage_Skills

**8 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | — | PK, Hidden |  |
| `Skill` | Text |  |  |
| `Description` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |

### Garage_Cashiers

**12 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `First Name` | Name |  |  |
| `Middle Name` | Name |  |  |
| `Last Name` | Name |  |  |
| `Contact Number` | Phone |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Full Name` | Name | Read-only, Virtual | `CONCA TEN ATE([First Name], " ",[Middle Name], " ",[Last Name])` |
| `Related Gar age_Job_or der_pa yments` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_pa yments", "Pr epair ed By ")` |

---

## 🔧 Garage — Job Orders

### Garage_Job_Orders

**26 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | — | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Job Or der Number` | Text |  |  |
| `Primar y Contact` | Ref | FK → Gar age_Cust omers |  |
| `Car` | Ref | FK → Gar age_Cars |  |
| `Check-in Date` | — |  |  |
| `Check-out Date` | DateTime |  |  |
| `Status` | Ref | FK → Gar age_Job_or ders_status |  |
| `Discount` | Price |  |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Related Gar age_Job_or der_labors` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_labors", "Job Or der")` |
| `Label` | Text | Read-only, Virtual |  |
| `Total Labor` | Price | Read-only, Virtual |  |
| `Related Gar age_Job_or der_materials` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_materials", "Job Or der")` |
| `Total Materials` | Price | Read-only, Virtual |  |
| `Final Price` | Price | Read-only, Virtual | `=[Total Labor]+[T otal Materials]-[Discount]` |
| `Related Gar age_Job_or der_pa yments` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_pa yments", "Job Or der")` |
| `Total P ayments` | Price | Read-only, Virtual |  |
| `Balance` | Price | Read-only, Virtual | `=[Final Price]-[T otal P ayments]` |
| `Related Gar age_Job_or der_phot os` | List | Read-only, Virtual | `REF_ROWS("Gar age_Job_or der_phot os", "Job Or der")` |
| `Related Gar age_Job_or der_comments` | List | Read-only, Virtual |  |
| `Related Labor Comments` | List | Read-only, Virtual |  |
| `Car Pr ofile Phot o` | Image | Read-only, Virtual | `=[Car].[Pr ofile Phot o]` |

### Garage_Job_order_photos

**8 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | — | PK, Hidden |  |
| `Job Or der` | Ref | FK → Gar age_Job_Or ders |  |
| `Phot o` | Image |  |  |
| `Comment` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |

### Garage_Job_order_comments

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Job Or der` | Ref | FK → Gar age_Job_Or ders, Hidden |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Created_date_b y` | Text | Read-only, Virtual | `=concatenate(text([Cr eated_date]), " (",[Cr eated_b y],")")` |

### Garage_Job_order_payments

**15 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Job Or der` | Ref | FK → Gar age_Job_Or ders |  |
| `OR Number` | Text |  |  |
| `Sales Inv oice Number` | Text |  |  |
| `Amount P aid` | Price |  |  |
| `Date P aid` | Date |  |  |
| `Prepair ed By` | Ref | FK → Gar age_Cashiers |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | — | Hidden |  |
| `Label` | Number | Read-only, Virtual |  |
| `Job Or der Balance` | Price | Read-only, Virtual | `=[Job Or der].[Balance]` |

### Garage_Job_order_labors

**19 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | — | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Job Or der` | Ref | FK → Gar age_Job_Or ders |  |
| `Labor` | Ref | FK → Gar age_Labor |  |
| `Price` | Price |  |  |
| `Discount` | — |  |  |
| `Total Price` | Price |  | `=[Price]-[Discount]` |
| `Status` | Ref | FK → Gar age_Job_or der_labor_status |  |
| `Target Date` | Date |  |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Related Gar age_Job_or der_labor_mechanics` | List | Read-only, Virtual |  |
| `Related Gar age_JO_labor_comments` | — | Read-only, Virtual | `REF_ROWS("Gar age_JO_labor_comments", "JO Labor ")` |
| `Related Gar age_JO_labor_phot os` | List | Read-only, Virtual | `REF_ROWS("Gar age_JO_labor_phot os", "JO Labor ")` |
| `User Comments` | List | Read-only, Virtual |  |
| `System Comments` | List | Read-only, Virtual |  |

### Garage_Job_order_labor_mechanics

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Job Or der Labor` | Ref | FK → Gar age_Job_or der_labors |  |
| `Mechanic` | Ref | FK → Gar age_Mechanics |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |

### Garage_JO_labor_photos

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `JO Labor` | Ref | FK → Gar age_Job_or der_labors |  |
| `Phot o` | Image |  |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |

### Garage_JO_labor_comments

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `JO Labor` | — | FK → Gar age_Job_or der_labors |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `created_date_b y` | Text | Read-only, Virtual | `=concatenate(text([Cr eated_date]), " (",[Cr eated_b y],")")` |

### Garage_Job_order_materials

**21 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Job Or der` | Ref | FK → Gar age_Job_Or ders |  |
| `Material` | Ref | FK → Parts |  |
| `Price` | — |  |  |
| `Quantity` | Number |  |  |
| `Total Price` | Price |  | `=[Price]*[Quantity]` |
| `Discount` | Price |  |  |
| `Final Price` | — |  | `=[Total Price]-[Discount]` |
| `Status` | Ref | FK → Gar age_Job_or der_materials_status |  |
| `Provided In-house` | Yes/No |  |  |
| `Include in Total` | Yes/No |  |  |
| `Year_Month` | Text | Hidden |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Related Gar age_JO_materials_comments` | List | Read-only, Virtual | `REF_ROWS("Gar age_JO_materials_comments", "JO Material")` |
| `Related Gar age_JO_materials_phot os` | List | Read-only, Virtual | `REF_ROWS("Gar age_JO_materials_phot os", "JO Material")` |
| `Provided In-house Displa y` | Text | Read-only, Virtual |  |

### Garage_JO_materials_photos

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `JO Material` | Ref | FK → Gar age_Job_or der_materials |  |
| `Phot o` | Image |  |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | — | Hidden |  |

### Garage_JO_materials_comments

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `JO Material` | Ref | FK → Gar age_Job_or der_materials |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden |  |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Created_date_b y` | Text | Read-only, Virtual | `=concatenate(text([Cr eated_date]), " (",[Cr eated_b y],")")` |

---

## ✅ Garage — Quality Control

### Garage_Quality_Checklist

**11 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Check List Name` | Name |  |  |
| `Description` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden | `=USEREM AIL()` |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Related Gar age_Quality_Checklist_Phot os` | List | Read-only, Virtual |  |
| `Related Gar age_Quality_Checklist_Videos` | List | Read-only, Virtual |  |
| `Related Gar age_Lapor_T ype_Quality_Checklists` | List | Read-only, Virtual |  |

### Garage_Quality_Checklist_Photos

**9 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Quality Checklist` | Ref | FK → Gar age_Quality_Checklist |  |
| `Phot o` | Image |  |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden | `=USEREM AIL()` |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |

### Garage_Quality_Checklist_Videos

**10 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | — | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `Quality Checklist` | Ref | FK → Gar age_Quality_Checklist |  |
| `Video` | File |  |  |
| `Comment` | — |  |  |
| `Last_update` | ChangeTimestamp | Hidden |  |
| `Last_updated_b y` | Email | Hidden | `=USEREM AIL()` |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Video Pla yer` | Show | Read-only, Virtual | `=TEXT([Video])` |

### Garage_Lapor_Type_Quality_Checklist

**7 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `Labor Type` | Ref | FK → Gar age_Labor |  |
| `Quality Checklist` | Ref | FK → Gar age_Quality_Checklist, Hidden |  |
| `Last_updated_b y` | Email | Hidden | `=USEREM AIL()` |
| `Created_date` | DateTime | Hidden |  |
| `Created_b y` | Email | Hidden |  |
| `Labor Type:Quality Checklist` | Text | PK, Read-only, Virtual | `=CONCA TEN ATE([Labor Type], ":",[Quality Checklist])` |

### Garage_Report_Monthly_parts_provided_in_house

**8 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_RowNumber` | Number | Hidden, Read-only |  |
| `ID` | Text | PK, Hidden |  |
| `YearMonth` | Text |  |  |
| `Provided In House` | Number | Read-only |  |
| `Total Number of P arts` | Number | Read-only |  |
| `Provided In House %` | Percent | Read-only |  |
| `Total Sales Recor ded Quantity` | Number | Read-only, Virtual |  |
| `Recor ded P ercentage` | Percent | Read-only, Virtual | `=([Pr ovided In House]*1.00)/[T otal Sales Recor ded Quantity]` |

---

## ⚙️ System

### _Per_User_Settings

**14 columns**

| Column | Type | Flags | Notes |
|---|---|---|---|
| `_EM AIL` | Email | Hidden | `USEREM AIL()` |
| `_NAME` | Name | Hidden | `USERN AME()` |
| `_LOCA TION` | LatLong | Hidden |  |
| `Options Heading` | Show | Hidden, Read-only |  |
| `Option 1` | Text | Hidden |  |
| `Option 2` | Number | Hidden |  |
| `Countr y Option` | Enum | Hidden |  |
| `Language Option` | Enum | Hidden |  |
| `Option 5` | Text | Hidden |  |
| `Option 6` | Number | Hidden |  |
| `Option 7` | Text | Hidden |  |
| `Option 8` | Text | Hidden |  |
| `Option 9` | Text | Hidden |  |
| `_THISUSER` | Text | PK, Hidden |  |

---

*Total: 709 columns across 70 tables*