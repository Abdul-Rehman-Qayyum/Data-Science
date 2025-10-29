# 🏥 Health Insurance Cost Analysis System

## 📘 Project Overview
This project analyzes and predicts **hospitalization costs** using real-world medical and hospitalization datasets.  
It integrates **Python**, **MySQL**, and **Tableau** to uncover the key factors influencing healthcare expenses and present insights visually.  
The project demonstrates end-to-end data analysis — from **data cleaning and SQL queries** to **machine learning modeling** and **interactive dashboarding**.

---

## 🧰 Tools & Technologies
- **Python:** Pandas, NumPy, Scikit-learn
- **MySQL Workbench 8.0:** Database design, data cleaning, and querying
- **Tableau:** Interactive dashboard and storytelling
- **Jupyter Notebook:** Data analysis and report generation

---

## ⚙️ Project Workflow

### 1️⃣ Data Preparation
- Two datasets used:
  - `medical_examination.xlsx` — patient-level health information (BMI, heart issues, diabetes, etc.)
  - `hospitalisation_details.xlsx` — hospitalization details (charges, tier, city, and state)
- Cleaned data in MySQL:
  - Removed duplicate and null records.
  - Eliminated invalid entries such as `'?'` from categorical columns.
  - Added **primary key constraint** on `Customer_ID` in both tables.
  - Merged datasets on `Customer_ID` to form a unified analytical view.

### 2️⃣ SQL Data Analysis
Key queries and insights include:
- Average hospitalization cost for patients with **heart issues and diabetes**.
- Cost distribution by **hospital tier** and **city level**.
- Count of patients with **major surgery and cancer history**.
- Number of **Tier-1 hospitals per state**.
- Identification of **high-cost states** and **patterns across hospital tiers**.

### 3️⃣ Machine Learning Analysis
- Built predictive models to estimate hospitalization costs using:
  - **Ridge Regression** with hyperparameter tuning via GridSearchCV.
  - **Gradient Boosting Regressor** for feature importance analysis.
- Evaluated models using 5-Fold Cross-Validation and **RMSE** scores.
- Identified most influential cost factors: **BMI**, **Heart Issues**, and **Hospital Tier**.

### 4️⃣ Visualization (Tableau)
- Created an **interactive Tableau dashboard** visualizing:
  - Cost distribution by **BMI**, **heart condition**, and **state**.
  - Average charges by **hospital tier** and **city tier**.
  - State-wise comparison of hospitalization patterns.
- Implemented data storytelling to clearly communicate findings.

---

## 📊 Key Insights
- Patients with higher **BMI** and **heart conditions** have higher hospitalization charges.
- **Tier-1 hospitals** tend to be more expensive but consistent in cost variation.
- **Urban (City Tier 1)** hospitals show higher costs than suburban (Tier 3) hospitals.
- Certain **states (R1011, R1013)** consistently report higher average costs.

---

## 📁 Project Structure
Health_Insurance_Analysis/
│
├── Health_insurance_analysis_dashboard.twb → Tableau dashboard file
├── Health_insurance_analysis.ipynb → Main Jupyter Notebook
├── Health_insurance_analysis.sql → SQL schema and queries
├── hospitalisation_details.xlsx → Hospitalization details data
├── medical_examination.xlsx → Medical examination data
├── Names.xlsx → Names of Customers 
└── README.md → Project documentation


---

## 🧩 How to Run
1. **Clone this repository:**
   ```bash
   git clone https://github.com/abdul-rehman-qayyum/data-science.git

Open Jupyter Notebook:

Launch Health_insurance_analysis.ipynb

Run all cells sequentially

Run SQL in MySQL Workbench:

Import XLSX files into tables

Execute Health_insurance_analysis.sql

Open Tableau Dashboard:

Open Health_insurance_analysis_dashboard.twb to explore visual insights

👤 Author

Abdul Rehman
Data Science Student | Machine Learning & BI Enthusiast
📧 Email: a.rehmanqayyum123@gmail.com

🔗 LinkedIn Profile: www.linkedin.com/in/abdul-rehman-qayyum

🔗 GitHub: github.com/abdul-rehman-qayyum