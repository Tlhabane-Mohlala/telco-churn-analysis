# Customer Churn Prediction Using Logistic Regression (Python + Databricks)

## 1. Project Overview

This project predicts **customer churn** for a telecom company using a **Logistic Regression** model built in **Databricks with PySpark**.

Given customer demographics, subscribed services, and billing information, the model estimates the probability that a customer will **churn (leave the company)**.

The goal is to:
- Help the business identify **high-risk customers**
- Design better **retention strategies**
- Reduce churn and protect recurring revenue

This repository showcases an end-to-end machine learning workflow including:
- Data understanding & exploratory data analysis (EDA)
- Data cleaning and feature engineering
- Logistic Regression model training using PySpark
- Model evaluation (Accuracy, ROC–AUC)
- Interpretation using **odds ratios**
---

## 2. Business Problem

Telecom companies lose significant revenue whenever customers cancel their contracts (churn). Acquiring new customers is generally more expensive than retaining existing ones.

**Objective:**  
Build a churn prediction model that flags customers at high risk of leaving, so that:
- Retention teams can intervene early
- Marketing can target the right segments with offers
- Product and pricing teams can adjust bundles, contracts and payment options

**Target Variable:**  
- `Churn Value`  
  - `1` → Customer churned  
  - `0` → Customer stayed

---

## 3. Dataset

The dataset is a Telco customer churn file (Excel) containing:

- **Customer Profile**
  - `Gender`, `Senior Citizen`, `Partner`, `Dependents`
- **Account & Contract Information**
  - `Tenure Months`, `Contract`, `Paperless Billing`, `Payment Method`
  - `Monthly Charges`, `Total Charges`
- **Services Subscribed**
  - `Phone Service`, `Multiple Lines`
  - `Internet Service`, `Online Security`, `Online Backup`
  - `Device Protection`, `Tech Support`
  - `Streaming TV`, `Streaming Movies`
- **Churn Columns**
  - `Churn Label` (Yes/No)
  - `Churn Value` (1/0)
  - `Churn Score`, `CLTV`, `Churn Reason`

For the model, the main target is **`Churn Value`**.

---
## 🔍 Model Results & Business Interpretation

### 📊 Model Performance
| Metric | Score |
|-------|--------|
| Accuracy | **0.693** |
| F1-Score | **0.712** |
| ROC-AUC | **0.735** |
| True Positives | 284 |
| True Negatives | 236 |
| False Positives | 150 |
| False Negatives | 80 |

---

## 🔥 Top Features Increasing Churn
| Feature | Coefficient |
|---------|-------------|
| Contract: Month-to-Month | +1.243 |
| Payment: Electronic Check | +0.772 |
| Internet Service: Fiber Optic | +0.341 |
| Tech Support = Yes | +0.106 |
| Phone Service = No | +0.051 |
| Online Security = No | +0.045 |

---

## ❄ Top Features Decreasing Churn
| Feature | Coefficient |
|---------|-------------|
| Contract: Two-Year | –0.683 |
| Contract: One-Year | –0.650 |
| Payment: Bank Transfer | –0.408 |
| Internet Service: DSL | –0.325 |
| Payment: Credit Card | –0.313 |

---

## 📈 Churn Rates by Segment

### Contract Type
- **Month-to-month:** 66%
- **One-year:** 25%
- **Two-year:** 27%

### Payment Method
- **Electronic check:** 66%
- **Mailed check:** 47%
- **Credit card:** 45%
- **Bank transfer:** 42%

---

## 💡 Key Business Insights

1. **Short-term contracts** drive churn → target with retention offers.  
2. **Electronic check customers** are high-risk → encourage safer payment methods.  
3. **Fiber optic users** churn more → investigate customer experience.  
4. **Add-on services matter** — lack of online security or tech support increases churn.  
5. **Tenure is a stabilizer** — the longer a customer stays, the lower the churn risk.
---
