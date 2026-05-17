-- ============================================================
-- PiVeRan Auto Parts — ERD Schema (PostgreSQL)
-- App ID: 3df8dccb-b3fb-419c-8b25-c077482253cc
-- ============================================================
-- All tables are created first without inline foreign keys to 
-- ensure ERD Lab parses all relationships perfectly via ALTER TABLE.

-- ============================================================
-- 1. LOOKUP / REFERENCE TABLES
-- ============================================================

CREATE TABLE "Brands" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Brand_Name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Cabinet_Codes" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Cabinet_Code" VARCHAR(100) NOT NULL
);

CREATE TABLE "Units" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Unit_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Inventory_Action" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Action_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Sales_type" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Type_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Add_stock_payment_type" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Payment_Type" VARCHAR(100) NOT NULL
);

CREATE TABLE "Cash_action" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Action_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Expense_Type" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Expense_Type_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Operating_Expense_type" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Operating_Expense_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "PR_Status" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Status_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "PR_lines_Status" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Status_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Parts_audit_status" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Status_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Garage_Job_orders_status" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Status_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Garage_Job_order_labor_status" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Status_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Garage_Job_order_materials_status" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Status_Name" VARCHAR(100) NOT NULL
);

CREATE TABLE "Garage_Cashiers" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Cashier_Name" VARCHAR(255) NOT NULL
);

-- ============================================================
-- 2. VENDOR & SUPPLIER DOMAIN
-- ============================================================

CREATE TABLE "Vendor" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Vendor_Name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Vendor_contact_numbers" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Vendor_ID" VARCHAR(36) NOT NULL,
    "Contact_Number" VARCHAR(50)
);

-- ============================================================
-- 3. PARTS & INVENTORY DOMAIN
-- ============================================================

CREATE TABLE "Parts" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Part_Name" VARCHAR(255) NOT NULL,
    "Brand_ID" VARCHAR(36),
    "Cabinet_code_ID" VARCHAR(36),
    "Latest_Supplier" VARCHAR(36),
    "Current_Stocks" INTEGER,
    "Critical_count" INTEGER
);

CREATE TABLE "Parts_photos" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Part_ID" VARCHAR(36) NOT NULL
);

CREATE TABLE "Parts_price" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Part_ID" VARCHAR(36) NOT NULL,
    "Price" NUMERIC(12,2)
);

CREATE TABLE "Parts_suppliers" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Part_ID" VARCHAR(36) NOT NULL,
    "Supplier_ID" VARCHAR(36) NOT NULL
);

CREATE TABLE "Parts_audit" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Part" VARCHAR(36) NOT NULL,
    "Status" VARCHAR(36),
    "Count" INTEGER
);

CREATE TABLE "Inventory_Log" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Part_ID" VARCHAR(36) NOT NULL,
    "Vendor_ID" VARCHAR(36),
    "Action_ID" VARCHAR(36),
    "Unit_ID" VARCHAR(36),
    "Sales_Type" VARCHAR(36),
    "Add_stock_Payment_Type" VARCHAR(36),
    "Quantity" INTEGER
);

-- ============================================================
-- 4. SALES & CASH DOMAIN
-- ============================================================

CREATE TABLE "Cash_Log" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Action_ID" VARCHAR(36),
    "Expense_Type" VARCHAR(36),
    "Operating_Expense_Type" VARCHAR(36),
    "Amount" NUMERIC(12,2)
);

-- ============================================================
-- 5. PURCHASE REQUEST DOMAIN
-- ============================================================

CREATE TABLE "Purchase_requests" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Status" VARCHAR(36),
    "Title" VARCHAR(255)
);

CREATE TABLE "PR_lines" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Purchase_request_ID" VARCHAR(36) NOT NULL,
    "Part_ID" VARCHAR(36),
    "Status" VARCHAR(36),
    "Supplier_ID" VARCHAR(36),
    "Quantity" INTEGER
);

CREATE TABLE "PR_lines_suppliers" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "PR_Lines_ID" VARCHAR(36) NOT NULL,
    "Vendor_ID" VARCHAR(36) NOT NULL
);

CREATE TABLE "PR_comments" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "PR_ID" VARCHAR(36) NOT NULL
);

CREATE TABLE "PR_line_comments" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "PR_Line_ID" VARCHAR(36) NOT NULL
);

CREATE TABLE "PR_Lines_photos" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "PR_Line_ID" VARCHAR(36) NOT NULL
);

-- ============================================================
-- 6. GARAGE / JOB ORDER DOMAIN
-- ============================================================

CREATE TABLE "Garage_Customers" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Customer_Name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Garage_customer_address" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Customer" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Customer_contact_numbers" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Customer" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Cars" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Primary_Owner" VARCHAR(36) NOT NULL,
    "Make" VARCHAR(100)
);

CREATE TABLE "Garage_Car_photos" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Car" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Job_Orders" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Primary_Contact" VARCHAR(36),
    "Car" VARCHAR(36),
    "Status" VARCHAR(36)
);

CREATE TABLE "Garage_Job_order_photos" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Job_Order" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Job_order_comments" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Job_Order" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Job_order_payments" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Job_Order" VARCHAR(36) NOT NULL,
    "Prepaired_By" VARCHAR(36)
);

CREATE TABLE "Garage_Labor_Types" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Labor_Type_Name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Garage_Labor_Prices" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Labor_Type" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Mechanics" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Mechanic_Name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Garage_Mechanics_contact_numbers" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Mechanic" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Job_order_labors" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Job_Order" VARCHAR(36) NOT NULL,
    "Labor" VARCHAR(36),
    "Status" VARCHAR(36)
);

CREATE TABLE "Garage_Job_order_labor_mechanics" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Job_Order_Labor" VARCHAR(36) NOT NULL,
    "Mechanic" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_JO_labor_photos" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "JO_Labor" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_JO_labor_comments" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "JO_Labor" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Job_order_materials" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Job_Order" VARCHAR(36) NOT NULL,
    "Material" VARCHAR(36),
    "Status" VARCHAR(36)
);

CREATE TABLE "Garage_JO_materials_photos" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "JO_Material" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_JO_materials_comments" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "JO_Material" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Quality_Checklist" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Checklist_Name" VARCHAR(255)
);

CREATE TABLE "Garage_Quality_Checklist_Photos" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Quality_Checklist" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Quality_Checklist_Videos" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Quality_Checklist" VARCHAR(36) NOT NULL
);

CREATE TABLE "Garage_Lapor_Type_Quality_Checklist" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Labor_Type" VARCHAR(36) NOT NULL,
    "Quality_Checklist" VARCHAR(36) NOT NULL
);

-- ============================================================
-- 7. SECURITY & ACCESS CONTROL DOMAIN
-- ============================================================

CREATE TABLE "Security_Users" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "User_Name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Security_Roles" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Role_Name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Security_User_roles" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "User" VARCHAR(36) NOT NULL,
    "Role" VARCHAR(36) NOT NULL
);

CREATE TABLE "Security_Role_views" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Role" VARCHAR(36) NOT NULL
);

CREATE TABLE "Security_Role_tables" (
    "ID" VARCHAR(36) PRIMARY KEY,
    "Role" VARCHAR(36) NOT NULL
);


-- ============================================================
-- 8. FOREIGN KEYS (All 62 Relationships)
-- ============================================================

-- Parts & Inventory
ALTER TABLE "Parts" ADD FOREIGN KEY ("Brand_ID") REFERENCES "Brands"("ID");
ALTER TABLE "Parts" ADD FOREIGN KEY ("Cabinet_code_ID") REFERENCES "Cabinet_Codes"("ID");
ALTER TABLE "Parts" ADD FOREIGN KEY ("Latest_Supplier") REFERENCES "Vendor"("ID");
ALTER TABLE "Parts_photos" ADD FOREIGN KEY ("Part_ID") REFERENCES "Parts"("ID");
ALTER TABLE "Parts_price" ADD FOREIGN KEY ("Part_ID") REFERENCES "Parts"("ID");
ALTER TABLE "Parts_suppliers" ADD FOREIGN KEY ("Part_ID") REFERENCES "Parts"("ID");
ALTER TABLE "Parts_suppliers" ADD FOREIGN KEY ("Supplier_ID") REFERENCES "Vendor"("ID");
ALTER TABLE "Parts_audit" ADD FOREIGN KEY ("Part") REFERENCES "Parts"("ID");
ALTER TABLE "Parts_audit" ADD FOREIGN KEY ("Status") REFERENCES "Parts_audit_status"("ID");
ALTER TABLE "Inventory_Log" ADD FOREIGN KEY ("Part_ID") REFERENCES "Parts"("ID");
ALTER TABLE "Inventory_Log" ADD FOREIGN KEY ("Vendor_ID") REFERENCES "Vendor"("ID");
ALTER TABLE "Inventory_Log" ADD FOREIGN KEY ("Action_ID") REFERENCES "Inventory_Action"("ID");
ALTER TABLE "Inventory_Log" ADD FOREIGN KEY ("Unit_ID") REFERENCES "Units"("ID");
ALTER TABLE "Inventory_Log" ADD FOREIGN KEY ("Sales_Type") REFERENCES "Sales_type"("ID");
ALTER TABLE "Inventory_Log" ADD FOREIGN KEY ("Add_stock_Payment_Type") REFERENCES "Add_stock_payment_type"("ID");

-- Vendor
ALTER TABLE "Vendor_contact_numbers" ADD FOREIGN KEY ("Vendor_ID") REFERENCES "Vendor"("ID");

-- Cash Log
ALTER TABLE "Cash_Log" ADD FOREIGN KEY ("Action_ID") REFERENCES "Cash_action"("ID");
ALTER TABLE "Cash_Log" ADD FOREIGN KEY ("Expense_Type") REFERENCES "Expense_Type"("ID");
ALTER TABLE "Cash_Log" ADD FOREIGN KEY ("Operating_Expense_Type") REFERENCES "Operating_Expense_type"("ID");

-- Purchase Requests
ALTER TABLE "Purchase_requests" ADD FOREIGN KEY ("Status") REFERENCES "PR_Status"("ID");
ALTER TABLE "PR_lines" ADD FOREIGN KEY ("Purchase_request_ID") REFERENCES "Purchase_requests"("ID");
ALTER TABLE "PR_lines" ADD FOREIGN KEY ("Part_ID") REFERENCES "Parts"("ID");
ALTER TABLE "PR_lines" ADD FOREIGN KEY ("Status") REFERENCES "PR_lines_Status"("ID");
ALTER TABLE "PR_lines" ADD FOREIGN KEY ("Supplier_ID") REFERENCES "Vendor"("ID");
ALTER TABLE "PR_lines_suppliers" ADD FOREIGN KEY ("PR_Lines_ID") REFERENCES "PR_lines"("ID");
ALTER TABLE "PR_lines_suppliers" ADD FOREIGN KEY ("Vendor_ID") REFERENCES "Vendor"("ID");
ALTER TABLE "PR_comments" ADD FOREIGN KEY ("PR_ID") REFERENCES "Purchase_requests"("ID");
ALTER TABLE "PR_line_comments" ADD FOREIGN KEY ("PR_Line_ID") REFERENCES "PR_lines"("ID");
ALTER TABLE "PR_Lines_photos" ADD FOREIGN KEY ("PR_Line_ID") REFERENCES "PR_lines"("ID");

-- Garage / Job Orders
ALTER TABLE "Garage_customer_address" ADD FOREIGN KEY ("Customer") REFERENCES "Garage_Customers"("ID");
ALTER TABLE "Garage_Customer_contact_numbers" ADD FOREIGN KEY ("Customer") REFERENCES "Garage_Customers"("ID");
ALTER TABLE "Garage_Cars" ADD FOREIGN KEY ("Primary_Owner") REFERENCES "Garage_Customers"("ID");
ALTER TABLE "Garage_Car_photos" ADD FOREIGN KEY ("Car") REFERENCES "Garage_Cars"("ID");
ALTER TABLE "Garage_Job_Orders" ADD FOREIGN KEY ("Primary_Contact") REFERENCES "Garage_Customers"("ID");
ALTER TABLE "Garage_Job_Orders" ADD FOREIGN KEY ("Car") REFERENCES "Garage_Cars"("ID");
ALTER TABLE "Garage_Job_Orders" ADD FOREIGN KEY ("Status") REFERENCES "Garage_Job_orders_status"("ID");
ALTER TABLE "Garage_Job_order_photos" ADD FOREIGN KEY ("Job_Order") REFERENCES "Garage_Job_Orders"("ID");
ALTER TABLE "Garage_Job_order_comments" ADD FOREIGN KEY ("Job_Order") REFERENCES "Garage_Job_Orders"("ID");
ALTER TABLE "Garage_Job_order_payments" ADD FOREIGN KEY ("Job_Order") REFERENCES "Garage_Job_Orders"("ID");
ALTER TABLE "Garage_Job_order_payments" ADD FOREIGN KEY ("Prepaired_By") REFERENCES "Garage_Cashiers"("ID");
ALTER TABLE "Garage_Labor_Prices" ADD FOREIGN KEY ("Labor_Type") REFERENCES "Garage_Labor_Types"("ID");
ALTER TABLE "Garage_Mechanics_contact_numbers" ADD FOREIGN KEY ("Mechanic") REFERENCES "Garage_Mechanics"("ID");
ALTER TABLE "Garage_Job_order_labors" ADD FOREIGN KEY ("Job_Order") REFERENCES "Garage_Job_Orders"("ID");
ALTER TABLE "Garage_Job_order_labors" ADD FOREIGN KEY ("Labor") REFERENCES "Garage_Labor_Types"("ID");
ALTER TABLE "Garage_Job_order_labors" ADD FOREIGN KEY ("Status") REFERENCES "Garage_Job_order_labor_status"("ID");
ALTER TABLE "Garage_Job_order_labor_mechanics" ADD FOREIGN KEY ("Job_Order_Labor") REFERENCES "Garage_Job_order_labors"("ID");
ALTER TABLE "Garage_Job_order_labor_mechanics" ADD FOREIGN KEY ("Mechanic") REFERENCES "Garage_Mechanics"("ID");
ALTER TABLE "Garage_JO_labor_photos" ADD FOREIGN KEY ("JO_Labor") REFERENCES "Garage_Job_order_labors"("ID");
ALTER TABLE "Garage_JO_labor_comments" ADD FOREIGN KEY ("JO_Labor") REFERENCES "Garage_Job_order_labors"("ID");
ALTER TABLE "Garage_Job_order_materials" ADD FOREIGN KEY ("Job_Order") REFERENCES "Garage_Job_Orders"("ID");
ALTER TABLE "Garage_Job_order_materials" ADD FOREIGN KEY ("Material") REFERENCES "Parts"("ID");
ALTER TABLE "Garage_Job_order_materials" ADD FOREIGN KEY ("Status") REFERENCES "Garage_Job_order_materials_status"("ID");
ALTER TABLE "Garage_JO_materials_photos" ADD FOREIGN KEY ("JO_Material") REFERENCES "Garage_Job_order_materials"("ID");
ALTER TABLE "Garage_JO_materials_comments" ADD FOREIGN KEY ("JO_Material") REFERENCES "Garage_Job_order_materials"("ID");
ALTER TABLE "Garage_Quality_Checklist_Photos" ADD FOREIGN KEY ("Quality_Checklist") REFERENCES "Garage_Quality_Checklist"("ID");
ALTER TABLE "Garage_Quality_Checklist_Videos" ADD FOREIGN KEY ("Quality_Checklist") REFERENCES "Garage_Quality_Checklist"("ID");
ALTER TABLE "Garage_Lapor_Type_Quality_Checklist" ADD FOREIGN KEY ("Labor_Type") REFERENCES "Garage_Labor_Types"("ID");
ALTER TABLE "Garage_Lapor_Type_Quality_Checklist" ADD FOREIGN KEY ("Quality_Checklist") REFERENCES "Garage_Quality_Checklist"("ID");

-- Security
ALTER TABLE "Security_User_roles" ADD FOREIGN KEY ("User") REFERENCES "Security_Users"("ID");
ALTER TABLE "Security_User_roles" ADD FOREIGN KEY ("Role") REFERENCES "Security_Roles"("ID");
ALTER TABLE "Security_Role_views" ADD FOREIGN KEY ("Role") REFERENCES "Security_Roles"("ID");
ALTER TABLE "Security_Role_tables" ADD FOREIGN KEY ("Role") REFERENCES "Security_Roles"("ID");
