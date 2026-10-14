# Data Cleaning — Fashion Retail Sales Analysis

## 1. Overview

Data Cleaning focuses on improving the quality and consistency of the fashion retail dataset before analysis. The work was performed using Python, Pandas, and NumPy in Jupyter Notebook.

The cleaning process involved handling missing values, correcting invalid values, standardizing dates and categorical fields, investigating unusual product prices, and validating sales and profitability calculations.

## 2. Initial Inspection

The initial project notebook was used to inspect the dataset through:

- Dataset preview and column inspection.
- Data types and structural information.
- Missing-value counts.
- Unique values in categorical columns.
- Invalid quantities, prices, discounts, and sales amounts.
- Duplicate-record checks.

## 3. Order Date Cleaning

- Converted `Order_Date` into a standardized datetime format using Pandas.
- Created `Order_Year` from the cleaned date.
- Regenerated `Order_Month` and `Order_Quarter`.
- Checked derived date information against the standardized date.
- Handled missing dates encountered during the cleaning workflow.

## 4. Units Sold Cleaning

- Identified zero and negative quantities.
- Replaced invalid non-positive quantities with missing values.
- Calculated the median of valid quantities.
- Used the median to fill missing quantities.

## 5. Unit Price Cleaning

- Identified missing unit prices.
- Filled missing prices using the median price for the corresponding product name in the initial cleaning notebook.
- In the detailed cleaning stage, investigated price variation by brand, product category, and product name.
- Calculated typical product prices using group-level medians.
- Examined price ratios to identify unusually high or low prices.
- Replaced flagged price values with the corresponding typical price according to the notebook's implemented rules.

## 6. Discount and Sales Amount Cleaning

### Discount Percentage
- Identified missing, negative, and invalid discount values.
- Restricted discounts to the valid range used in the cleaning workflow.
- Standardized discount values to the expected levels of 0%, 5%, 10%, 15%, 20%, 25%, 30%, 35%, and 40%.
- Handled negative discounts using the product-based discount logic implemented in the notebook.

### Sales Amount
- Identified zero and negative sales amounts.
- Recalculated sales amounts from the cleaned unit price, units sold, and discount percentage.

The implemented formula was:

`Sales_Amount = Unit_Price × Units_Sold × (1 − Discount_% / 100)`

## 7. Profit and Profit Margin

- Recalculated profit using sales amount and cost amount.
- Recalculated profit margin using the updated profit and sales amount.
- Rounded profit margin to two decimal places.
- Validated the relationship between sales amount, cost amount, profit, and profit margin.

Formulas:

`Profit = Sales_Amount − Cost_Amount`

`Profit_Margin_% = (Profit / Sales_Amount) × 100`

## 8. Customer Segment Cleaning

- Inspected missing and inconsistent segment values.
- Replaced missing values with `Unknown` during the initial cleaning stage.
- Investigated whether customers had consistent segment information across their records.
- Used known customer-level segment information to fill some unknown values in the detailed cleaning workflow.
- Retained `Unknown` when a segment could not be determined using the implemented logic.

## 9. City Standardization

Standardized city names by removing surrounding whitespace, applying consistent capitalization, and replacing selected spelling variations and alternate names.

Examples included variations of Bengaluru/Bangalore, Hyderabad, Ahmedabad, Kolkata, Mumbai, Delhi, and Chennai.

## 10. Duplicate and Final Validation Checks

- Checked duplicate records.
- Removed duplicate records in the detailed cleaning workflow.
- Removed temporary columns created during price investigation.
- Rechecked date-derived fields.
- Validated sales, profit, and profit margin calculations.
- Saved the cleaned dataset for use in the transformation stage.

## 11. Output

The detailed cleaning notebook exports the final cleaned dataset as:

`Fashion_Retail_Sales_Cleaned_Final.csv`

The final cleaned file is used as the input to the data transformation notebook.

## 12. Conclusion

The cleaning process prepares the dataset for analysis by addressing data quality issues and improving the consistency of sales, pricing, discount, financial, customer, and date-related information. The resulting cleaned data provides the foundation for subsequent transformation and exploratory analysis.
