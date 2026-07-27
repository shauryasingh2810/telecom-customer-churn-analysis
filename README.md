# Telecom Customer Churn Analysis

## Project Overview

This project analyzes **3,150 telecom customers** to identify behaviors associated with customer churn and determine which customers should be prioritized for retention.

I used **SQL Server** to analyze churn patterns, identify high-risk customer groups, and create an explainable risk segmentation. I then built an interactive **Tableau dashboard** to communicate the findings.

### Business Question

> **Which customers are most likely to churn, and what factors are associated with that churn?**

---

## Dashboard

![Telecom Customer Churn Dashboard](https://raw.githubusercontent.com/shauryasingh2810/telecom-customer-churn-analysis/main/dashboard/Telecom%20Customer%20Churn%20Analysis.png)

### Interactive Tableau Dashboard

[**View Interactive Tableau Dashboard →**](https://public.tableau.com/app/profile/shaurya.singh8249/viz/TelecomCustomerChurnAnalysisPublic/TelecomCustomerChurnAnalysis)

---

## Tools Used

- **SQL Server / SSMS** — data validation, analysis and customer segmentation
- **Tableau** — interactive dashboard and data visualization
- **Excel / CSV** — initial data review and column standardization
- **GitHub** — project documentation and portfolio presentation

---

## Dataset

**Iranian Telecom Churn Dataset**

The dataset contains **3,150 customer records** with information about customer activity, service usage, complaints, subscription length and churn.

### Data Source

This project uses a processed version of the Iranian Telecom Churn Dataset.

- Original dataset: [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/563/iranian+churn+dataset)
- Portfolio dataset: [Kaggle - Iranian Telecom Company Churn](https://www.kaggle.com/datasets/tombutton/iranian-telecom-company-churn)

### Data Quality

| Metric | Result |
|---|---:|
| Customers | 3,150 |
| Columns | 13 |
| Missing Values | 0 |
| Duplicate Rows | 0 |
| Churned Customers | 495 |
| Overall Churn Rate | **15.71%** |

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

## Key Findings

### 1. Complaints were the strongest churn signal

Customers who complained had an **82.99% churn rate**, compared with only **10.14%** among customers without complaints.

### 2. Inactive customers had substantially higher churn

- Inactive customers: **47.31% churn**
- Active customers: **5.28% churn**

### 3. Low engagement was strongly associated with churn

Low-frequency customers had a **33.92% churn rate**, while churn fell sharply among customers with higher service usage.

Customers with low total usage time had a **40.14% churn rate**, compared with only **0.33%** among very-high-usage customers.

### 4. New customers showed elevated churn

Customers within their first **12 months** had a **38.57% churn rate**.

New customers with low usage had an even higher **87.04% churn rate**.

### 5. Age was not a major churn differentiator

Churn rates across age groups were relatively similar:

- 30–40: **16.14%**
- Under 30: **15.86%**
- Over 40: **14.34%**

---

## Customer Risk Segmentation

Based on the SQL findings, I created an explainable rule-based customer risk segmentation using:

- Complaints
- Customer activity status
- Frequency of use
- Subscription length

### Segmentation Results

| Risk Segment | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| **High Risk** | 190 | 173 | **91.05%** |
| **Medium Risk** | 972 | 264 | **27.16%** |
| **Low Risk** | 1,988 | 58 | **2.92%** |

### Key Result

The segmentation clearly separated customers with very different churn behavior:

> **High Risk: 91.05% → Medium Risk: 27.16% → Low Risk: 2.92%**

This provides an explainable way to prioritize customers for retention efforts.

---

## Business Recommendations

### Prioritize complaint customers

Complaint customers showed an **82.99% churn rate**. Retention teams could prioritize faster complaint resolution and follow-up with dissatisfied customers.

### Monitor low-engagement customers

Low usage across service activity was consistently associated with higher churn. Customers showing low engagement could be investigated as potential retention priorities.

### Improve early customer engagement

Customers within their first year showed elevated churn, particularly when combined with low usage. Stronger onboarding and early engagement programs could help retention teams investigate this group.

### Focus retention resources on high-risk customers

The High-Risk segment contains only **190 customers**, but **173 of them churned**.

Retention efforts could therefore be prioritized toward customers displaying combinations of complaints, inactivity, low usage and early tenure.

---

## SQL Analysis

The complete SQL analysis is available here:

[**View Complete SQL Analysis →**](sql/churn_analysis.sql)

The SQL file includes:

- Dataset validation
- Overall churn calculations
- Churn analysis by customer attributes
- Customer engagement analysis
- High-risk segment analysis
- Rule-based risk segmentation
- Tableau analysis view

### Detailed Analysis Notes

[**View SQL Analysis Notes →**](docs/SQL_Analysis_Notes.md)

---

## Repository Structure

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
│   ├── Telecom Customer Churn Analysis.png
│   └── Telecom Customer Churn Analysis Public.twbx
│
├── docs/
│   └── SQL_Analysis_Notes.md
│
└── README.md
```

---

## Limitations

This project is an **exploratory and descriptive analysis**.

The customer risk segments are rule-based and should not be interpreted as machine-learning churn probabilities.

The identified relationships show **associations within this dataset** and do not prove that individual factors directly cause customer churn.

Some high-risk customer combinations also contain relatively small numbers of customers and should therefore be interpreted carefully.

---

## Author

**Shaurya Singh**

Data Analytics Portfolio Project

**Skills Demonstrated:**  
SQL Server • Tableau • Data Analysis • Data Visualization • Customer Segmentation • Business Problem Solving
