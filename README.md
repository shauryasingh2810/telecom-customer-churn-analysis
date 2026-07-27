# Telecom Customer Churn Analysis

## Project Overview

This project analyzes **3,150 telecom customers** to identify customer behaviors associated with churn and determine which customer groups should be prioritized for retention.

I used **SQL Server** for data analysis and customer segmentation, then built an interactive **Tableau dashboard** to communicate the findings.

The main objective was to answer:

> **Which customers are most likely to churn, and what factors are associated with that churn?**

---

## Tools Used

- SQL Server / SSMS
- Tableau
- Excel / CSV
- GitHub

---

## Dataset

**Iranian Telecom Churn Dataset**

The dataset contains **3,150 customer records** and information about customer activity, usage, complaints, subscription length and churn.

### Data Source

This project uses a processed version of the Iranian Telecom Churn Dataset.

- Original dataset: [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/563/iranian+churn+dataset)
- Portfolio dataset: [Kaggle - Iranian Telecom Company Churn](https://www.kaggle.com/datasets/tombutton/iranian-telecom-company-churn)

### Target Variable

- `1` = Churned
- `0` = Retained

### Main Features

- Subscription Length
- Charge Amount
- Seconds of Use
- Frequency of Use
- Frequency of SMS
- Distinct Called Numbers
- Call Failures
- Tariff Plan
- Status
- Age Group
- Complaints
- Churn

### Data Quality Check

| Metric | Result |
|---|---:|
| Rows | 3,150 |
| Columns | 13 |
| Missing Values | 0 |
| Duplicate Rows | 0 |
| Unique Customers | 3,150 |

The dataset was already relatively clean. Column names were standardized before importing the data into SQL Server.

---

## Project Workflow

```text
Dataset
   ↓
Data Audit & Cleaning
   ↓
SQL Server Import
   ↓
Churn Analysis
   ↓
Customer Behaviour Analysis
   ↓
High-Risk Segment Identification
   ↓
Rule-Based Risk Segmentation
   ↓
Tableau Dashboard
   ↓
Business Recommendations
```

---

# SQL Analysis

## Overall Churn

| Metric | Value |
|---|---:|
| Total Customers | 3,150 |
| Churned Customers | 495 |
| Retained Customers | 2,655 |
| Churn Rate | **15.71%** |

---

## Key Findings

### 1. Complaints

| Group | Churn Rate |
|---|---:|
| Complaint | **82.99%** |
| No Complaint | 10.14% |

Customers who complained had a dramatically higher churn rate.

**Finding:** Complaints were one of the strongest churn signals in the dataset.

---

### 2. Customer Status

| Status | Churn Rate |
|---|---:|
| Inactive | **47.31%** |
| Active | 5.28% |

**Finding:** Inactive customers were substantially more likely to churn than active customers.

---

### 3. Usage Level

| Usage Level | Churn Rate |
|---|---:|
| Low | **33.92%** |
| Medium | 16.38% |
| High | 4.82% |
| Very High | 0.00% |

**Finding:** Churn decreased sharply as customer usage increased, showing a strong association between low engagement and churn.

---

### 4. Total Usage Time

| Usage Time | Churn Rate |
|---|---:|
| Low | **40.14%** |
| Medium | 19.80% |
| High | 9.98% |
| Very High | 0.33% |

**Finding:** Customers with very low service usage had much higher churn than highly engaged customers.

---

### 5. SMS Usage

| SMS Activity | Churn Rate |
|---|---:|
| No SMS | 22.72% |
| Low | 21.51% |
| Medium | 2.65% |
| High | 0.75% |

**Finding:** Customers with medium or high SMS activity had much lower churn.

---

### 6. Distinct Called Numbers

| Contact Level | Churn Rate |
|---|---:|
| Low | **31.26%** |
| Medium | 14.41% |
| High | 5.12% |
| Very High | 0.00% |

**Finding:** Customers interacting with fewer distinct numbers showed higher churn, providing another indicator of low engagement.

---

### 7. Subscription Length

| Subscription Length | Churn Rate |
|---|---:|
| 0–12 Months | **38.57%** |
| 13–24 Months | 2.77% |
| 25–36 Months | 18.85% |
| 37+ Months | 13.16% |

**Finding:** Customers in their first 12 months showed particularly high churn.

The pattern was not completely linear, as the 13–24 month customer group had an unusually low churn rate.

---

### 8. Tariff Plan

| Tariff Plan | Churn Rate |
|---|---:|
| Plan A | **16.83%** |
| Plan B | 2.45% |

**Finding:** Plan A customers showed considerably higher churn than Plan B customers in this dataset.

---

### 9. Age Group

| Age Group | Churn Rate |
|---|---:|
| 30–40 | 16.14% |
| Under 30 | 15.86% |
| Over 40 | 14.34% |

**Finding:** Churn rates were relatively similar across age groups, so age was not considered a major churn-risk indicator.

---

### 10. Call Failures

Call failures did not show a consistent pattern where churn increased as call failures increased.

**Finding:** Call failures alone were not considered a strong churn indicator.

---

# High-Risk Customer Groups

After analyzing individual customer characteristics, combinations of high-risk behaviors were tested.

| Customer Group | Customers | Churn Rate |
|---|---:|---:|
| Inactive + Complaint | 158 | **89.24%** |
| Inactive + Low Usage | 446 | 42.83% |
| Inactive + Complaint + Low Usage | 36 | **100%** |
| Complaint + Low Usage | 63 | **100%** |
| New Customer + Low Usage | 54 | **87.04%** |
| Complaint + New Customer | 29 | **100%** |

These combinations showed that **complaints, inactivity and low engagement together created particularly strong churn signals**.

> Some segments with 100% churn contain relatively small numbers of customers, so these results should be interpreted carefully.

---

# Customer Risk Segmentation

Based on the SQL findings, I created an explainable **rule-based customer risk segmentation**.

### High Risk

Customers with a complaint and at least one of the following:

- Inactive status
- Low frequency of use
- Subscription length of 12 months or less

### Medium Risk

Customers who had at least one of the following:

- Inactive status
- Low frequency of use
- Subscription length of 12 months or less

but did not meet the High-Risk criteria.

### Low Risk

Customers who did not meet the High- or Medium-Risk conditions.

---

## Risk Segmentation Results

| Risk Segment | Customers | Churned Customers | Churn Rate |
|---|---:|---:|---:|
| **High Risk** | 190 | 173 | **91.05%** |
| **Medium Risk** | 972 | 264 | **27.16%** |
| **Low Risk** | 1,988 | 58 | **2.92%** |

### Key Result

The segmentation clearly separated customers with very different churn behavior:

> **High Risk: 91.05% → Medium Risk: 27.16% → Low Risk: 2.92%**

This provides an explainable way to prioritize customers for retention efforts.

---

# Tableau Dashboard

The final Tableau dashboard presents the major churn indicators and allows users to explore customer risk segments interactively.

![Telecom Customer Churn Dashboard](dashboard/Telecom%20Customer%20Churn%20Analysis.png)
### Dashboard KPIs

- **Total Customers:** 3,150
- **Churned Customers:** 495
- **Overall Churn Rate:** 15.71%
- **High-Risk Customers:** 190

### Dashboard Includes

- Churn Rate by Complaints
- Churn Rate by Customer Status
- Churn Rate by Risk Segment
- Churn Rate by Usage Level
- Churn Rate by Subscription Length
- Interactive Risk Segment Filter
- Key Business Insights

## Interactive Dashboard

[**View the Interactive Tableau Dashboard →**](https://public.tableau.com/app/profile/shaurya.singh8249/viz/TelecomCustomerChurnAnalysisPublic/TelecomCustomerChurnAnalysis)

---

# Business Recommendations

### 1. Prioritize Complaint Customers

Customers who submitted complaints showed an **82.99% churn rate**.

Retention teams could prioritize rapid complaint resolution and follow-up with dissatisfied customers.

### 2. Monitor Low-Engagement Customers

Low service usage was consistently associated with higher churn.

Useful engagement indicators include:

- Frequency of use
- Seconds of use
- SMS frequency
- Number of distinct called numbers

Customers showing low engagement could be investigated before they churn.

### 3. Improve Early Customer Engagement

Customers within their first 12 months showed a **38.57% churn rate**.

New customers with low usage had an even higher **87.04% churn rate**.

This suggests that onboarding and early customer engagement are important areas for retention teams to investigate.

### 4. Prioritize High-Risk Customers

The High-Risk segment contained **190 customers**, of whom **173 churned**.

Instead of applying the same retention strategy to every customer, resources could be focused on customers showing combinations of:

- Complaints
- Inactivity
- Low engagement
- Early subscription tenure

---

# Repository Structure

```text
telecom-customer-churn-analysis/
│
├── data/
│   └── iranian-telecom-churn-cleaned.csv
│
├── sql/
│   └── churn_analysis.sql
│
├── dashboard/
│   ├──Telecom Customer Churn Analysis.png
│   └── Telecom Customer Churn Analysis Public.twbx
│
├── docs/
│   └── SQL_Analysis_Notes.md
│
└── README.md
```

---

# Project Files

### SQL Analysis

[View Complete SQL Analysis](sql/churn_analysis.sql)

The SQL file contains:

- Dataset validation
- Overall churn analysis
- Churn analysis by customer characteristics
- Customer engagement analysis
- High-risk customer analysis
- Risk segmentation logic
- Tableau analysis view

### Analysis Notes

[View SQL Analysis Notes](docs/SQL_Analysis_Notes.md)

### Tableau Workbook

The packaged Tableau workbook is available inside the `dashboard` folder.

---

# Key Takeaways

The strongest churn indicators identified in this project were:

1. **Customer complaints**
2. **Inactive customer status**
3. **Low service usage**
4. **Low overall customer engagement**
5. **Early subscription tenure**

The analysis also showed that combining multiple customer behaviors provided much stronger churn-risk signals than analyzing many variables individually.

---

# Limitations

This project is an exploratory and descriptive analysis.

The customer risk segments are **rule-based segments**, not churn probabilities generated using a machine-learning model.

The findings represent **associations within this dataset** and should not be interpreted as proof that any individual factor directly causes customer churn.

Some high-risk customer combinations also contain relatively small sample sizes and should therefore be interpreted carefully.

---

## Author

**Shaurya Singh**

Data Analytics Portfolio Project

**Skills Demonstrated:**  
SQL Server • Tableau • Data Analysis • Data Visualization • Customer Segmentation • Business Problem Solving
