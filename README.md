# Video Rental Store Analytics - SQL Queries

This project analyzes a video rental store database using SQL queries to extract insights related to film inventory, customer behavior, rental transactions, and pricing strategies. The goal is to support business decisions regarding marketing campaigns, inventory management, and revenue optimization.

## Project Overview

- **Objective**: Use SQL queries to analyze rental patterns, film popularity, and customer behavior.  
- **Dataset**: A relational database containing tables for films, rentals, customers, actors, and transactions.  
- **Methodology**:
  - SQL queries for data retrieval, filtering, and aggregation.
  - Joins to connect multiple tables and extract business insights.
  - Case statements and categorization for enhanced analysis.
- **Key Deliverables**:
  - Insights into film inventory and rental patterns.
  - Identification of top-performing films and actors.
  - Evaluation of pricing structures and customer engagement.

## Key Features

### Film Inventory Analysis

- Queried film titles containing specific keywords for targeted promotions.
- Classified films as Short, Medium, or Long based on duration.
- Identified the top three most expensive films based on replacement cost.

### Actor and Film Popularity

- Determined the most featured actor in the rental store’s inventory.
- Identified actors who appeared in films containing specific keywords.

### Rental Transactions and Customer Behavior

- Analyzed rental transaction volume during historically high-demand months.
- Identified the most rented film in the store’s history.
- Evaluated customer loyalty based on total rental transactions.
- Determined how many films have never been rented.

### Pricing and Revenue Insights

- Assessed the distribution of films across different rental rate categories.
- Identified the most expensive rental rate in the database.
- Analyzed the number of films listed at specific rental price points.

## Tools and Technologies

- SQL for querying and data analysis.
- PostgreSQL / SQLite / MySQL for database management.
- Jupyter Notebook or SQL-based IDE for query execution.

## Next Steps

- Implement stored procedures for automated reporting.
- Develop a dashboard using Power BI or Tableau to visualize rental trends.
- Expand analysis to include seasonal trends and customer segmentation.
