# Azure-Data-Engineering-Project

End-to-end *ETL Data Pipeline* built on *Microsoft Azure, covering **data ingestion, **transformation, and **serving layers, with **Power BI* connection for validation.

---

## 🧩 Project Overview
This project demonstrates a complete *ETL workflow* using:
- *Azure Data Factory (ADF)* → Data ingestion from an HTTP source into *Azure Data Lake Gen2 (Raw Layer)*.  
- *Azure Databricks (PySpark)* → Data cleaning, transformation, and aggregation (Silver Layer).  
- *Azure Synapse Analytics* → External tables and SQL views for analytical queries (Gold Layer).  
- *Power BI* → Connected to Synapse for data validation and future reporting.

---

## 🏗 Architecture
![Architecture Diagram](Documentation/data-pipeline-Architecture.png)

---

## 📂 Repository Structure
```
Azure-Data-Engineering-Project/
│
├── data/AdventureWorks/
├── Documentation/Project_Steps.pdf
├── Databricks/silver_layer.ipynb
├── Synapse-SQL/ (views + external tables)
├── JSON-Git-Parameters/git.json
└── README.md
```
