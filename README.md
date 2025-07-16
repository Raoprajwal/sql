# 🛒 Blinkit Sales Analysis using SQL

## 📌 Project Objective

This project focuses on analyzing the **sales performance**, **customer satisfaction**, and **inventory distribution** of Blinkit using **SQL queries** to extract key insights.

The objective is to:
- Identify top-performing item categories
- Evaluate the effect of fat content and outlet types on sales
- Derive meaningful KPIs like Total Sales, Average Sales, and Customer Ratings

---

## 👨‍💻 About Me

**Name**: Prajwal Rao  
🎓 MSc Business Analytics  
🏫 MAHE, Manipal  
📧 prajwalrao02@gmail.com

---

## 🧠 Project Overview

### Tools Used
- **MySQL / SQL Server**: For data querying and transformation
##

---

## 📊 Key KPIs Calculated

| Metric           | Description                               |
|------------------|-------------------------------------------|
| **Total Sales**  | Total revenue generated                   |
| **Average Sales**| Average sales value per transaction       |
| **No. of Items** | Count of total orders/items               |
| **Avg Rating**   | Average customer rating across products   |

---

## 🔎 SQL Query Highlights

### 🔹 Data Cleaning
- Standardized `Item_Fat_Content` values (e.g., LF → Low Fat)
```sql
UPDATE blinkit_data
SET Item_Fat_Content = CASE 
  WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
  WHEN Item_Fat_Content = 'reg' THEN 'Regular'
  ELSE Item_Fat_Content
END;


