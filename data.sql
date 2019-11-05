-- Get all customers and their addresses.
SELECT customers.first_name, addresses.street, addresses.city, addresses.state, addresses.zip FROM customers 
JOIN addresses ON customers.id=addresses.customer_id;

-- Get all orders and their line items (orders, quantity and product).
SELECT orders.order_date, products.description, line_items.quantity FROM orders 
JOIN line_items ON orders.id=line_items.order_id 
JOIN products ON products.id=line_items.product_id;

-- Which warehouses have cheetos?
SELECT warehouse.warehouse, products.description FROM warehouse 
JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id 
JOIN products ON warehouse_product.product_id=products.id 
WHERE products.description='cheetos';

-- Which warehouses have diet pepsi?
SELECT warehouse.warehouse, products.description FROM warehouse 
JOIN warehouse_product ON warehouse.id=warehouse_product.warehouse_id 
JOIN products ON warehouse_product.product_id=products.id 
WHERE products.description='diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.id, customers.first_name, customers.last_name, COUNT(orders.id) FROM customers 
FULL OUTER JOIN addresses ON customers.id=addresses.customer_id 
FULL OUTER JOIN orders ON orders.address_id=addresses.id 
GROUP BY customers.id;

-- How many customers do we have?
SELECT COUNT(customers.id) FROM customers;

-- How many products do we carry?
SELECT COUNT(products.id) FROM products;

-- What is the total available on-hand quantity of diet pepsi?
SELECT products.description, SUM(warehouse_product.on_hand) FROM products 
JOIN warehouse_product ON products.id=warehouse_product.product_id 
WHERE products.description='diet pepsi' 
GROUP BY products.description;