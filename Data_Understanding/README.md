# Data Understanding — Fashion Retail Sales Analysis

## 1. Overview

Data Understanding is the stage in which the raw fashion retail dataset is inspected to understand its structure, available variables, data quality issues, and suitability for answering the business questions defined during Business Understanding.

This stage documents the initial observations and establishes a plan for data cleaning.

## 2. Dataset Description

The dataset contains fashion retail transaction information covering the following areas:

- **Order details:** Order ID, order date, order channel, and payment method.
- **Customer details:** Customer ID, customer name, gender, age, age group, and segment.
- **Product details:** Product name, product category, brand, size, and color.
- **Sales details:** Units sold, unit price, discount percentage, and sales amount.
- **Financial details:** Cost amount, profit, and profit margin.
- **Location details:** City, state, and region.
- **Time-related details:** Order year, order month, order quarter, and day of the week.

## 3. Initial Data Quality Assessment

The Day 22 Data Understanding document identified the following issues in the raw dataset.

| Column | Initial observation | Planned approach |
|---|---|---|
| `Order_Date` | Inconsistent date formats | Standardize dates and regenerate derived date columns |
| `Units_Sold` | 321 rows contain -2, -1, or 0 | Treat as invalid and replace using the median of valid quantities |
| `Unit_Price` | 903 missing values | Impute using the median unit price for the respective product |
| `Sales_Amount` | 1,752 zero values and 59 negative values | Recalculate after cleaning dependent sales fields |
| `Discount_%` | 1,261 missing values | Evaluate and derive values after cleaning dependent columns |
| `City` | Inconsistent names and spelling variations | Standardize city names |
| `Segment` | 624 missing values | Initially categorize missing values as `Unknown` |
| `Profit` | No missing values reported | Preserve positive, negative, and zero values for further review |
| `Profit_Margin_%` | 1,752 missing values | Recalculate after cleaning sales-related columns |
| Date-derived columns | Potential inconsistencies with the order date | Regenerate from standardized dates |
| Duplicate records | No completely duplicated rows identified | Verify during cleaning |

These counts describe the initial assessment documented in Day 22 and should not be interpreted as the final post-cleaning counts.

## 4. Cleaning Dependencies

The cleaning approach follows the dependencies between the sales-related fields:

`Units_Sold → Unit_Price → Discount_% → Sales_Amount → Profit_Margin_%`

The order date is standardized separately, followed by regeneration of the year, month, quarter, and day-of-week information.

This sequence helps ensure that dependent calculations are performed using cleaned input values.

## 5. Key Areas Requiring Attention

### Numerical Data
- Missing and invalid quantities.
- Missing unit prices.
- Zero and negative sales amounts.
- Missing and invalid discounts.
- Missing profit margin values.

### Categorical Data
- Inconsistent city names.
- Missing customer segments.
- Potential inconsistencies in customer and product classifications.

### Date Data
- Mixed date formats.
- Derived columns that need to be checked against the standardized date.

## 6. Expected Outcome

The objective of Data Understanding is to document the initial data quality issues, identify dependencies between columns, and establish a systematic cleaning plan before conducting exploratory analysis.
