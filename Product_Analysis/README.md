# Product Analysis — Fashion Retail Sales Analysis

## 1. Overview

Product Analysis evaluates individual product performance using sales, profit, profit margin, and monthly sales movements.

The objective is to identify high-selling and low-selling products, compare product profitability, investigate products with high sales but relatively low margins, and examine changes in product sales over time.

The analysis was conducted using Python, Pandas, NumPy, Matplotlib, and Seaborn.

## 2. Input Dataset

`Fashion_Retail_Sales_Cleaned_Transformed.csv`

## 3. Analysis Performed

### 3.1 Top 10 Products by Sales

Grouped transaction records by `Product_Name` and aggregated total sales.

Sorted the results in descending order to identify the top 10 products by total sales.

The analysis also retained product category information to support product-level comparisons.

### 3.2 Bottom 10 Products by Sales

Aggregated sales by product name and sorted the results in ascending order.

This identifies products with relatively low total sales within the analyzed dataset and helps prioritize products for further investigation.

### 3.3 Product Profitability

Aggregated profit by product to compare the financial contribution of individual products.

Products were ranked according to their total profit to identify those contributing more to overall profitability.

### 3.4 Product Profit Margin

Calculated product-level sales and profit totals, then derived profit margin.

**Formula:**

`Product Profit Margin (%) = (Total Product Profit / Total Product Sales) × 100`

This provides a relative profitability measure for comparing products with different sales volumes.

### 3.5 High-Sales, Low-Margin Products

Used percentile-based thresholds to identify products with relatively high sales and lower profit margins.

The analysis compares product sales and profit margin to identify products that may warrant further investigation into pricing, discounting, and cost structure.

This classification indicates an analytical pattern rather than proving why a product has a lower margin.

### 3.6 Monthly Product Sales Trends

Aggregated sales by product, year, and month.

The analysis then:

- Ordered monthly records chronologically.
- Calculated previous-month sales for each product.
- Calculated the difference between current and previous recorded monthly sales.
- Classified sales movements as `Increased`, `Decreased`, or `No Change`.
- Counted declining sales observations by product.
- Examined products whose recorded month-to-month changes were consistently negative across the available comparisons.

The first available monthly observation for a product has no previous-month comparison, so its sales change cannot be calculated using this method.

## 4. Key Analytical Questions

- Which products generate the highest sales?
- Which products have the lowest sales?
- Which products contribute the most profit?
- How do product profit margins differ?
- Which high-sales products have comparatively low profit margins?
- Which products show repeated monthly sales declines?
- How does product performance change across recorded months?

## 5. Business Value

The analysis helps compare products across multiple performance measures rather than relying only on sales volume.

Products with high sales but relatively low profit margins may require further examination, while products with low sales or repeated declines may warrant investigation into demand, pricing, availability, and other relevant business factors.

## 6. Conclusion

Product Analysis provides a structured view of product-level sales and profitability. By combining sales rankings, profit margins, and monthly comparisons, it helps identify products that perform well, products requiring further attention, and potential areas for deeper business investigation.
