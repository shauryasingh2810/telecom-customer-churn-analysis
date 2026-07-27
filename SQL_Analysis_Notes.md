TELECOM CUSTOMER CHURN — SQL ANALYSIS NOTES

Dataset:
3,150 customers
495 churned
2,655 retained
Overall churn rate: 15.71%

Key Findings:

1. Complaints
Complaint customers: 82.99% churn
No complaint: 10.14%
Finding: Complaints are strongly associated with churn.

2. Customer Status
Inactive: 47.31% churn
Active: 5.28%
Finding: Inactive customers have substantially higher churn.

3. Tariff Plan
Plan A: 16.83%
Plan B: 2.45%
Finding: Plan A customers showed higher churn in this dataset.

4. Age Group
30–40: 16.14%
Under 30: 15.86%
Over 40: 14.34%
Finding: Age was not a major churn differentiator.

5. Subscription Length
0–12 months: 38.57%
13–24 months: 2.77%
25–36 months: 18.85%
37+ months: 13.16%
Finding: Customers in their first 12 months showed high churn.

6. Call Failures
No clear consistent relationship between call failures and churn.
Finding: Call failures alone were not a strong churn indicator.

7. Frequency of Use
Low: 33.92%
Medium: 16.38%
High: 4.82%
Very High: 0%
Finding: Churn decreased sharply as customer usage increased.

8. SMS Usage
No SMS: 22.72%
Low: 21.51%
Medium: 2.65%
High: 0.75%
Finding: Higher engagement was associated with lower churn.

9. Distinct Called Numbers
Low: 31.26%
Medium: 14.41%
High: 5.12%
Very High: 0%
Finding: Less-connected customers showed higher churn.

10. Seconds of Use
Low: 40.14%
Medium: 19.80%
High: 9.98%
Very High: 0.33%
Finding: Low usage time was one of the strongest churn signals.

HIGH-RISK SEGMENTS

Inactive + Complaint:
158 customers
89.24% churn

Complaint + Low Usage:
63 customers
100% churn

New Customer + Low Usage:
54 customers
87.04% churn

Complaint + New Customer:
29 customers
100% churn

FINAL RISK SEGMENTATION

High Risk:
190 customers
91.05% churn

Medium Risk:
972 customers
27.16% churn

Low Risk:
1,988 customers
2.92% churn

Conclusion:
Complaints, inactivity and low customer engagement were the strongest churn indicators. The rule-based risk segmentation successfully separated customers into groups with very different churn rates.

Note:
These results show associations in the dataset and should not be interpreted as proof that these factors directly cause churn.