## Anomaly Analysis

An anomaly refers to inconsistencies or issues that arise due to poor database design, particularly when multiple entities are stored in a single denormalized table. The `orders_flat.csv` file exhibits all three classic anomalies: insert, update, and delete anomalies.

### Insert Anomaly

An insert anomaly occurs when certain data cannot be inserted into the database without the presence of other unrelated data.

**Example:**  
It is not possible to insert a new product or a new sales representative into the system unless an order is also created.

**Evidence from CSV:**  
All rows require values for the following columns:
- `order_id`
- `order_date`
- `quantity`

There is no way to add a product such as `P009 – Keyboard` or a new sales representative without creating a dummy order entry.

**Relevant columns:**  
`product_id`, `product_name`, `sales_rep_id`, `sales_rep_name`, `order_id`

---

### Update Anomaly

An update anomaly occurs when the same piece of data is repeated across multiple rows, and updating it requires changes in many places.

**Example:**  
Sales Representative **SR01 – Deepak Joshi** appears in numerous rows with the same email and office address. If his office address changes, it must be updated in every row where `SR01` appears.

**Evidence from CSV:**  
Multiple rows such as:
- `ORD1114`
- `ORD1153`
- `ORD1083`
- `ORD1091`

All contain:
- `sales_rep_id = SR01`
- `sales_rep_email = deepak@corp.com`
- `office_address = "Mumbai HQ, Nariman Point, Mumbai - 400021"`

Failing to update even one row would result in inconsistent data.

**Relevant columns:**  
`sales_rep_name`, `sales_rep_email`, `office_address`

---

### Delete Anomaly

A delete anomaly occurs when deleting a row unintentionally removes additional valuable information.

**Example:**  
If the last order placed by a customer is deleted, all information about that customer is lost from the dataset.

**Evidence from CSV:**  
Deleting all rows associated with:
- `customer_id = C008` (Kavya Rao)

would remove the customer’s:
- Name
- Email
- City

Similarly, deleting all orders for a product such as `P008 – Webcam` would completely remove the product’s existence from the database.

**Relevant columns:**  
`customer_id`, `customer_name`, `product_id`, `product_name`


## Normalization Justification
While storing all data in a single table may appear simpler initially, the orders_flat.csv dataset clearly demonstrates why this approach is problematic at scale. The flat structure introduces redundancy, inconsistencies, and operational risks that normalization is designed to eliminate.
For example, customer information such as name, email, and city is repeated for every order placed by the same customer. In the dataset, “Rohan Mehta” appears across dozens of rows. If his email address changes, it must be updated in every occurrence. Missing even one update results in inconsistent data, which directly impacts reporting accuracy. This is a classic update anomaly that normalization resolves by storing customer data in a dedicated table.
Similarly, sales representative details such as office address and email are duplicated across all orders they handle. This not only wastes storage but also increases the likelihood of data errors. The dataset already shows minor inconsistencies such as variations in office address formatting (e.g., “Nariman Point” vs “Nariman Pt”), highlighting the risk.
From an insertion and deletion perspective, the flat table fails to support independent entity management. New products or sales representatives cannot be added unless an order exists, and deleting the last order for a product or customer removes all knowledge of that entity.
Normalization to Third Normal Form separates concerns into customers, products, orders, and sales representatives. This design improves data integrity, supports scalability, and makes the database easier to maintain and query. Therefore, normalization is not over-engineering; it is essential for reliable and professional database design.

