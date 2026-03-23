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
