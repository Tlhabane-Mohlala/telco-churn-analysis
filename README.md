# Telco Customer Churn Prediction – Logistic Regression (Databricks + PySpark)

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
