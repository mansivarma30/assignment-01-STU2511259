## Architecture Recommendation

For a fast-growing food delivery startup that collects GPS location logs, customer text reviews, payment transactions, and restaurant menu images, I would recommend a **Data Lakehouse architecture**.

First, the startup is dealing with highly diverse data types. GPS logs are time-series data, customer reviews are unstructured text, payment transactions are structured and require strong consistency, and menu images are unstructured binary data. A traditional data warehouse is not well suited for handling unstructured or semi-structured data at this scale, whereas a data lake can store all these raw formats efficiently. A lakehouse combines this flexibility with structure.

Second, the lakehouse model allows **both analytics and operational workloads** on the same data. Business teams can run SQL-based analytics for reporting and dashboards, while data scientists can access raw data for machine learning models such as delivery time prediction, fraud detection, or sentiment analysis on reviews. This avoids maintaining separate systems for analytics and AI workloads.

Third, a data lakehouse provides **schema enforcement and data governance** on top of low-cost object storage. Technologies such as Delta Lake, Iceberg, or Hudi enable ACID transactions, versioning, and time travel, which are important for correcting data errors and ensuring reliable reporting—something a pure data lake lacks.

In contrast, a data warehouse would be too rigid and expensive for large-scale raw data, and a pure data lake would lack strong data management features. Therefore, a data lakehouse offers the best balance of scalability, flexibility, cost efficiency, and analytical power for a fast-growing food delivery startup.
