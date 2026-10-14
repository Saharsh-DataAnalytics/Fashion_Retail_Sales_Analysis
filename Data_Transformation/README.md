# Data Transformation — Fashion Retail Sales Analysis

## 1. Overview

Data Transformation is the stage in which the cleaned fashion retail dataset is enriched with additional analytical columns. These columns classify sales, profitability, customer purchasing frequency, product performance, and order size.

The transformation was implemented using Python, Pandas, and NumPy in Jupyter Notebook.

## 2. Input Dataset

`Fashion_Retail_Sales_Cleaned_Final.csv`

The cleaned dataset serves as the input for the transformation process.

## 3. Transformations Performed

### 3.1 Sales Category

Created `Sales_Category` to classify transaction sales amounts into three groups using predefined quartile thresholds.

- **Low Sales:** Sales amount less than or equal to the first-quartile threshold.
- **Medium Sales:** Sales amount above the first quartile and less than or equal to the third-quartile threshold.
- **High Sales:** Sales amount above the third-quartile threshold.

The notebook uses the following thresholds:

- Q1: 998
- Q3: 1,522.90

### 3.2 Profit Category

Created `Profit_Category` to classify profit values into:

- Loss
- Break-Even
- Low Profit
- High Profit

The classification uses profit values and predefined thresholds, including the first and third quartiles.

### 3.3 Customer Type

Calculated the number of distinct orders for each customer using `Customer_ID` and `Order_ID`.

Created `Customer_Order_Count` and used it to classify customers:

- **One-Time Customer:** One distinct order.
- **Occasional Customer:** Two to six distinct orders.
- **Frequent Customer:** More than six distinct orders.

### 3.4 Product Performance

Aggregated sales by `Product_Name` and classified products using quartile-based thresholds.

- **Low Performer:** Product sales at or below the first quartile.
- **Average Performer:** Product sales above the first quartile and at or below the third quartile.
- **High Performer:** Product sales above the third quartile.

The notebook uses these product-level sales thresholds:

- Q1: 142,089.55
- Q3: 322,299.325

Created `Product_Performance` and mapped the classification back to the transaction-level dataset.

### 3.5 Order Size

Calculated total units sold for each `Order_ID` and created:

- `Total_Units_Per_Order`
- `Order_Size`

Orders were classified as:

- **Small Order:** Two units or fewer.
- **Medium Order:** More than two and up to five units.
- **Large Order:** More than five units.

## 4. Validation and Export

- Inspected the newly created columns.
- Reviewed the resulting classifications.
- Checked the transformed dataset's dimensions.
- Exported the transformed data to CSV.
- Reloaded the exported file and checked its dimensions.

## 5. Output Dataset

`Fashion_Retail_Sales_Cleaned_Transformed.csv`

The transformation notebook reports a dataset containing 4,000 rows and 36 columns.

## 6. Conclusion

The transformation stage converts cleaned transaction data into useful analytical categories. These classifications support comparisons of customer purchasing frequency, sales levels, profit levels, product performance, and order size in the subsequent analysis stages.
