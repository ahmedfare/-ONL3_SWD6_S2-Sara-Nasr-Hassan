-- ==========================================
-- Database Test Queries - OpenCart Project
-- Prepared by: Team 2
-- ==========================================

-- Test ID: DB-001 / DB-003
-- Purpose: Verify new customer creation (Create/Select)
-- Query Type: SELECT
SELECT firstname, email, password FROM oc_customer WHERE email = 'sara.ali@test.com';


-- Test ID: DB-002
-- Purpose: Verify customer creation timestamp (Date Integrity)
-- Query Type: SELECT
SELECT date_added FROM oc_customer WHERE email = 'time.check@test.com';


-- Test ID: DB-004
-- Purpose: Verify updated product price (Update/Select)
-- Query Type: SELECT
SELECT price FROM oc_product WHERE product_id = 45;


-- Test ID: DB-005 / DB-010
-- Purpose: Verify product stock quantity (Inventory Logic / Bug Check)
-- Query Type: SELECT
SELECT quantity FROM oc_product WHERE product_id = 46;


-- Test ID: DB-006
-- Purpose: Verify cascade delete for product and related records
-- Query Type: SELECT
SELECT * FROM oc_product WHERE product_id = 47;
SELECT * FROM oc_product_description WHERE product_id = 47;
SELECT * FROM oc_product_to_category WHERE product_id = 47;


-- Test ID: DB-007
-- Purpose: Verify order creation and related products
-- Query Type: SELECT
SELECT order_id, customer_id FROM oc_order ORDER BY order_id DESC LIMIT 1;
SELECT product_id, quantity FROM oc_order_product WHERE order_id = [NEW_ORDER_ID];


-- Test ID: DB-008
-- Purpose: Verify order total calculation (Calculation Logic)
-- Query Type: SELECT
SELECT total FROM oc_order WHERE order_id = 21;


-- Test ID: DB-009
-- Purpose: Attempt inserting invalid foreign key (Negative Test)
-- Query Type: INSERT
INSERT INTO oc_order_product (order_id, product_id, name, model, quantity, price, total)
VALUES (21, 9999, 'Test Product', 'Model-999', 1, 10.00, 10.00);


-- Test ID: DB-010
-- Purpose: Force negative inventory bug (Bug Test)
-- Query Type: UPDATE
UPDATE oc_product SET quantity = -5 WHERE product_id = 45;


-- Test ID: DB-011
-- Purpose: Verify product quantity after order cancellation (Inventory Restore)
-- Query Type: SELECT
SELECT quantity FROM oc_product WHERE product_id = [PRODUCT_Q_ID];
