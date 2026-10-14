# Customer Analysis — Fashion Retail Sales Analysis

## 1. Overview

Customer Analysis examines customer sales contribution, average transaction spending, purchasing frequency, and customer-type distribution.

The objective is to understand how customers contribute to overall sales and to compare purchasing patterns across different customer groups.

The analysis was performed using Python, Pandas, NumPy, Matplotlib, and Seaborn.

## 2. Input Dataset

`Fashion_Retail_Sales_Cleaned_Transformed.csv`

The dataset includes customer identifiers, customer names, order IDs, sales amounts, and the customer classifications created during data transformation.

## 3. Analysis Performed

### 3.1 Total Sales per Customer

Grouped transaction records by `Customer_Name` and summed `Sales_Amount` to calculate total sales associated with each customer.

This provides a customer-level view of sales contribution.

### 3.2 Top 10 Customers

Sorted customers by total sales in descending order and identified the top 10 customers.

This comparison highlights customers with the highest recorded sales contributions.

### 3.3 Average Customer Spending

Grouped the dataset by `Customer_ID` and `Customer_Name` and calculated the mean `Sales_Amount`.

This metric provides an average transaction sales value for each customer represented in the dataset.

### 3.4 Repeat Customer Analysis

Counted the number of distinct `Order_ID` values associated with each customer.

This helps identify customers who placed multiple orders and compare their purchasing frequency.

### 3.5 Customer Revenue Contribution

Calculated each customer's percentage contribution to total sales.

**Formula:**

`Customer Contribution (%) = (Customer Sales / Total Sales) × 100`

This metric shows how much each customer contributes to the overall sales total.

### 3.6 Customer Type Analysis

Used the `Customer_Type` classification created during data transformation.

The analysis aggregates sales by customer type and calculates the percentage of total sales contributed by each group.

The classifications are:

- One-Time Customer
- Occasional Customer
- Frequent Customer

## 4. Visualizations and Outputs

The customer analysis notebook includes calculations and comparisons for:

- Total sales per customer.
- Top 10 and top 20 customers by sales.
- Average customer spending.
- Customers ranked by distinct order count.
- Individual customer sales contribution.
- Sales distribution across customer types.
- Customer-type contribution as a percentage of total sales.

## 5. Business Value

The analysis helps investigate:

- Which customers contribute the most to sales.
- How sales contributions differ between customers.
- Which customers place multiple orders.
- How purchasing frequency relates to sales contribution.
- How sales are distributed across customer types.

These findings can support further investigation into customer engagement and retention opportunities.

## 6. Conclusion

Customer Analysis provides a customer-level view of fashion retail performance by examining sales contribution, average transaction value, order frequency, and customer-type distribution. It supports a better understanding of purchasing patterns within the available dataset.
