# SML-Online-Store
### Marketing Analytics for an Online Store (Simulative Case Study)

This project explores marketing and user behavior data for an online store. The goal is to analyze acquisition channels, engagement metrics, and monetization patterns using SQL. 

The study is based on data provided as part of the practical assignment for the Simulative Data Analyst course.
The source with the task description, explanations, and data is available [here](https://github.com/Krabkvadrat/webinars_data/blob/main/training/sql_metrics/README.md) (in Russian). 

Proceed to the questions and solutions.

### Overview of the assignment

#### The data includes 
  - information about 50 users acquired during Q1 2024,
  - data on 6 marketing campaigns differing by acquisition channels,
  - details of 225+ clicks within those campaigns,
  - over 1,000 user sessions with varying levels of engagement,
  - 150+ orders; and 300+ order items.

#### Tables are
  - `users` — information about customers and their acquisition channels,
  - `products` — product catalog with prices and cost of goods sold,
  - `campaigns` — marketing campaigns with spending and impressions,
  - `campaign_clicks` — individual click events with associated costs,
  - `user_sessions` — daily user activity,
  - `orders` — purchase transactions,
  - `order_items` — detailed line items for each order.

#### To reproduce locally
  - This project is built using PostgreSQL.
  - SQL scripts are included in the repository:
    - [01_ddl_schema.sql](01_ddl_schema.sql) — contains all CREATE TABLE statements that define the database schema,
    - [02_mock_data.sql](02_mock_data.sql) — contains all INSERT INTO statements that populate the tables with mock data for analysis,
    - queries/ — folder with individual analytical SQL script.
