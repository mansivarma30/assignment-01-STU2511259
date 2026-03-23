# Design Justification

## Storage Systems

To support the hospital network’s four goals, the architecture uses multiple specialized storage systems, each chosen based on data characteristics and access patterns. For core clinical data such as patient demographics, admissions, diagnoses, and treatment history, a **relational OLTP database** (for example, PostgreSQL or MySQL) is used. This system provides strong ACID guarantees, which are essential in healthcare environments where data accuracy, consistency, and regulatory compliance are critical.

To enable **plain-English querying of patient history**, a **vector database** is introduced. Unstructured and semi-structured clinical text—such as doctor notes, discharge summaries, and diagnosis descriptions—is converted into embeddings and stored as vectors. This allows semantic search, enabling doctors to retrieve relevant patient history even when queries do not exactly match the wording used in records.

For **management and operational reporting**, a **data warehouse** is used. Aggregated and cleaned data from the transactional systems is loaded into a dimensional model optimized for OLAP workloads. This supports fast queries for monthly reports such as bed occupancy rates, department-wise costs, and utilization trends without impacting real-time clinical systems.

For **real-time ICU vitals**, a **data lake** is used as the primary storage layer. Streaming data from monitoring devices is ingested through a streaming platform and stored in raw form. The data lake supports large-scale time-series storage, long-term retention, and reuse for both analytics and machine learning model training, such as readmission risk prediction.

---

## OLTP vs OLAP Boundary

The OLTP portion of the system includes the **Electronic Health Records system and real-time vitals ingestion pipeline**, where data is continuously created and updated. These systems prioritize low latency, high availability, and transactional consistency to support day-to-day hospital operations.

The OLAP boundary begins once data is extracted from these transactional systems and written to the **data lake and data warehouse**. At this stage, data is transformed, standardized, and aggregated for analytics, reporting, and machine learning. This clear separation ensures that analytical workloads do not interfere with clinical operations, while still enabling advanced insights from historical data.

---

## Trade-offs

A key trade-off in this architecture is **increased system complexity**. Using multiple storage systems—relational databases, vector databases, data lakes, and data warehouses—introduces higher operational overhead, integration challenges, and monitoring requirements.

This trade-off is mitigated by using standardized data pipelines, centralized metadata management, and automation for data ingestion and transformation. Clear data ownership, robust access controls, and observability tools further reduce operational risk. While the architecture is more complex than a single-database solution, it provides the flexibility, scalability, and performance required to safely support AI-driven healthcare use cases without compromising patient care or system reliability.
