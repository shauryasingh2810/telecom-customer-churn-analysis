# Telecom Customer Churn — Analysis Notes

## Quick Summary

I analyzed **3,150 telecom customers** to understand which customer behaviors were most strongly associated with churn.

- Total customers: **3,150**
- Churned customers: **495**
- Retained customers: **2,655**
- Overall churn rate: **15.71%**

---

## What I Found

### Complaints

This was one of the strongest patterns in the dataset.

- Customers with complaints: **82.99% churn**
- Customers without complaints: **10.14% churn**

Customers who complained were much more likely to churn.

---

### Customer Status

- Inactive customers: **47.31% churn**
- Active customers: **5.28% churn**

Inactive customers clearly represented a much higher-risk group.

---

### Tariff Plan

- Plan A: **16.83% churn**
- Plan B: **2.45% churn**

Plan A customers showed higher churn in this dataset.

---

### Age

- 30–40: **16.14%**
- Under 30: **15.86%**
- Over 40: **14.34%**

There was very little difference between age groups, so age did not appear to be an important churn indicator.

---

### Subscription Length

- 0–12 months: **38.57%**
- 13–24 months: **2.77%**
- 25–36 months: **18.85%**
- 37+ months: **13.16%**

Customers in their first year had the highest churn rate.

The relationship was not completely linear because the 13–24 month group had unusually low churn.

---

### Call Failures

Call failures did not show a clear pattern.

Customers with more call failures were not consistently more likely to churn, so I did not treat this as a major risk factor on its own.

---

## Customer Engagement

Engagement-related variables showed some of the clearest churn patterns.

### Frequency of Use

- Low: **33.92%**
- Medium: **16.38%**
- High: **4.82%**
- Very High: **0%**

Churn dropped sharply as usage increased.

### SMS Usage

- No SMS: **22.72%**
- Low: **21.51%**
- Medium: **2.65%**
- High: **0.75%**

Customers with higher SMS activity were much less likely to churn.

### Distinct Called Numbers

- Low: **31.26%**
- Medium: **14.41%**
- High: **5.12%**
- Very High: **0%**

Customers who interacted with fewer distinct numbers showed higher churn.

### Seconds of Use

- Low: **40.14%**
- Medium: **19.80%**
- High: **9.98%**
- Very High: **0.33%**

Low usage time was another strong churn signal.

---

# High-Risk Customer Groups

After looking at individual variables, I combined some of the strongest signals.

### Inactive + Complaint
- Customers: **158**
- Churn rate: **89.24%**

### Complaint + Low Usage
- Customers: **63**
- Churn rate: **100%**

### New Customer + Low Usage
- Customers: **54**
- Churn rate: **87.04%**

### Complaint + New Customer
- Customers: **29**
- Churn rate: **100%**

These smaller groups showed that combining complaint history with low engagement or early tenure created very high-risk customer segments.

---

# Final Risk Segmentation

I created a simple rule-based segmentation using complaints, activity status, usage and subscription length.

| Risk Segment | Customers | Churn Rate |
|---|---:|---:|
| High Risk | 190 | **91.05%** |
| Medium Risk | 972 | **27.16%** |
| Low Risk | 1,988 | **2.92%** |

The segmentation separated customers into groups with very different churn behavior.

---

## Final Takeaway

The strongest churn signals in this analysis were:

- Customer complaints
- Inactive status
- Low service usage
- Low overall engagement
- Early customer tenure

The biggest takeaway was that **customer engagement mattered more than basic demographic factors such as age**.

The risk segmentation also showed that combining several behavioral signals was much more useful than looking at a single variable in isolation.

---

## Note

This is an exploratory analysis.

The results show relationships within this dataset and should not be interpreted as proof that these factors directly cause churn.
