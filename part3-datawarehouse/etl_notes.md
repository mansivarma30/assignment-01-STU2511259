## ETL Decisions

### Decision 1 — Date Format Standardization
Problem:
The raw retail_transactions.csv contained inconsistent date formats such as
DD-MM-YYYY, MM/DD/YYYY, and some text-based month values. This inconsistency
made time-based aggregation unreliable.

Resolution:
All dates were transformed into a standard ISO format (YYYY-MM-DD) during
the transformation phase. A surrogate date_id was generated, and additional
attributes such as month, month_name, and year were derived for analytical
queries.

---

### Decision 2 — Handling NULL and Missing Values
Problem:
Some transaction records had NULL values for quantity or unit price, which
would result in incorrect revenue calculations or failed inserts.

Resolution:
Records with critical NULLs (quantity or price) were either discarded or
corrected using business rules (e.g., replacing NULL quantity with 1 where
transaction value existed). Only valid, complete records were loaded into
the fact table.

---

### Decision 3 — Category Casing and Consistency
Problem:
Product categories in the raw data appeared in multiple forms such as
"electronics", "ELECTRONICS", and "Electronics", leading to fragmented
aggregations.

Resolution:
All category values were standardized to title case (e.g., "Electronics",
"Clothing", "Groceries") during transformation. This ensured consistent
grouping and accurate category-level reporting in the data warehouse.
