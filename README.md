# Heart Disease Analysis Using R

## 📌 Project Overview

This project focuses on analyzing heart disease data using **R programming** to identify patterns, explore relationships between clinical attributes, and build a Logistic Regression model to classify the presence or absence of heart disease.

The project covers data cleaning, exploratory data analysis (EDA), statistical correlation, model development, performance evaluation, and prediction for a new patient.

## 🎯 Objectives

- Explore and understand the heart disease dataset.
- Identify and handle missing values and duplicate records.
- Analyze the distribution of heart disease cases.
- Investigate relationships between clinical attributes and heart disease.
- Build a Logistic Regression classification model.
- Evaluate model performance using a confusion matrix and classification metrics.
- Demonstrate prediction for a new patient using the trained model.

## 🛠️ Technologies Used

- **Programming Language:** R
- **Data Analysis:** R data frames and statistical functions
- **Data Visualization:** R visualization tools
- **Machine Learning:** Logistic Regression
- **Model Evaluation:** Confusion Matrix, Accuracy, Sensitivity, Specificity, Precision, and Balanced Accuracy

## 📂 Project Workflow

1. **Data Loading:** Import the heart disease dataset into R.
2. **Data Exploration:** Examine the dataset dimensions, variable types, descriptive statistics, and target distribution.
3. **Data Cleaning:** Identify missing values and duplicate records, then remove incomplete observations for the analysis.
4. **Exploratory Data Analysis:** Investigate patient characteristics and visualize relevant distributions and relationships.
5. **Correlation Analysis:** Examine associations between numerical variables and the heart disease target.
6. **Data Splitting:** Divide the cleaned dataset into training and testing sets using an 80:20 split.
7. **Model Building:** Train a Logistic Regression model using selected clinical attributes.
8. **Model Evaluation:** Assess classification performance using a confusion matrix and evaluation metrics.
9. **Prediction:** Apply the trained model to a new patient record.

## 📊 Dataset Description

The original dataset contains **920 observations and 16 columns** representing patient information and clinical attributes.

Some of the attributes used in the analysis include:

| Attribute | Description |
|---|---|
| `age` | Patient's age |
| `sex` | Patient's sex |
| `cp` | Chest pain type |
| `trestbps` | Resting blood pressure |
| `chol` | Serum cholesterol |
| `fbs` | Fasting blood sugar indicator |
| `restecg` | Resting electrocardiographic results |
| `thalch` | Maximum heart rate achieved |
| `exang` | Exercise-induced angina |
| `oldpeak` | ST depression associated with exercise |
| `slope` | Slope of the peak exercise ST segment |
| `ca` | Number of major vessels |
| `thal` | Thalassemia-related categorical attribute |
| `num` | Original heart disease classification |

### Target Variable

The original `num` variable was converted into a binary target called `HeartDisease`:

- **0 — No Heart Disease:** `num = 0`
- **1 — Heart Disease:** `num > 0`

## 🧹 Data Cleaning Results

The original dataset contained missing values in several clinical attributes.

| Attribute | Missing values |
|---|---:|
| `trestbps` | 59 |
| `chol` | 30 |
| `fbs` | 90 |
| `thalch` | 55 |
| `exang` | 55 |
| `oldpeak` | 62 |
| `ca` | 611 |

No duplicate records were identified in the executed analysis.

After removing rows containing missing values, the dataset was reduced from **920 observations to 303 observations**. The cleaned dataset was used for subsequent analysis and model development.

**Important limitation:** Complete-case analysis removed a substantial portion of the original data. This may introduce selection bias and affect how well the model generalizes to other patients.

## 🔍 Exploratory Data Analysis

Exploratory Data Analysis was performed to understand the patient population and examine patterns in the clinical variables.

The original dataset had the following age statistics:

- **Minimum age:** 28 years
- **Mean age:** 53.51 years
- **Median age:** 54 years
- **Maximum age:** 77 years

### Target Distribution

After converting the original target into a binary classification variable, the class distribution was:

| Class | Number of records | Percentage |
|---|---:|---:|
| No Heart Disease (0) | 163 | 53.80% |
| Heart Disease (1) | 140 | 46.20% |
| **Total** | **303** | **100%** |

The cleaned dataset contains both classes, with a relatively balanced distribution between patients with and without the target condition.

## 📈 Correlation Analysis

Correlation analysis was used to examine the linear relationships between numerical variables and the binary heart disease target.

| Variable | Correlation with `HeartDisease` |
|---|---:|
| `oldpeak` | +0.4253 |
| `thalch` | -0.4186 |
| `age` | +0.2214 |
| `trestbps` | +0.1504 |
| `chol` | +0.0816 |

### Interpretation

- **`oldpeak` (+0.4253):** Showed a moderate positive correlation with the binary target.
- **`thalch` (-0.4186):** Showed a moderate negative correlation with the binary target.
- **`age` (+0.2214):** Showed a relatively weak positive correlation.
- **`trestbps` (+0.1504):** Showed a weak positive correlation.
- **`chol` (+0.0816):** Showed a weak linear correlation with the target.

These results describe associations in this dataset and do not establish causation. Correlation alone does not determine the predictive importance or clinical significance of a variable.

## 🤖 Model Development

A **Logistic Regression** model was trained to classify whether a patient belongs to the no-heart-disease or heart-disease class.

The model used clinical attributes such as age, sex, chest pain type, resting blood pressure, cholesterol, fasting blood sugar, resting ECG, maximum heart rate, exercise-induced angina, oldpeak, slope, number of major vessels, and thalassemia-related category.

### Train-Test Split

The cleaned dataset was divided into training and testing subsets.

| Subset | Number of observations |
|---|---:|
| Training set | 243 |
| Testing set | 60 |
| **Total** | **303** |

The training set was used to fit the model, while the testing set was used to evaluate its predictions on observations not used for fitting.

## 📊 Model Evaluation Results

The Logistic Regression model achieved the following results on the test set:

| Evaluation metric | Result |
|---|---:|
| Accuracy | 86.67% |
| Sensitivity | 86.21% |
| Specificity | 87.10% |
| Positive Predictive Value (Precision) | 86.21% |
| Negative Predictive Value | 87.10% |
| Balanced Accuracy | 86.65% |
| Cohen's Kappa | 0.733 |

### Confusion Matrix

The confusion matrix below summarizes the model's predictions against the actual test-set classes.

| Actual class | Predicted: No Heart Disease | Predicted: Heart Disease |
|---|---:|---:|
| No Heart Disease (0) | 27 | 4 |
| Heart Disease (1) | 4 | 25 |

### Interpretation

- **27 true negatives:** The model correctly classified 27 patients in class 0.
- **25 true positives:** The model correctly classified 25 patients in class 1.
- **4 false positives:** Four class-0 observations were predicted as class 1.
- **4 false negatives:** Four class-1 observations were predicted as class 0.

The model correctly classified 52 out of 60 test observations, resulting in an accuracy of **86.67%**. Its sensitivity and specificity were also relatively similar, indicating comparable performance across the two classes in this test set.

However, the test set is small, so these metrics should be interpreted cautiously. Further validation is required before drawing conclusions about performance on other populations.

## 🧪 New Patient Prediction

The trained model was tested on a new patient record with the following characteristics:

| Attribute | Value |
|---|---|
| Age | 55 |
| Sex | Male |
| Chest pain type | Asymptomatic |
| Resting blood pressure | 140 |
| Cholesterol | 250 |
| Fasting blood sugar | FALSE |
| Resting ECG | Normal |
| Maximum heart rate | 150 |
| Exercise-induced angina | FALSE |
| Oldpeak | 1 |
| Slope | Flat |
| Number of major vessels | 0 |
| Thal | Normal |

### Prediction Result

- **Predicted probability for the positive class:** 0.4478 (approximately 44.78%)
- **Classification threshold:** 0.50
- **Predicted class:** 0 — No Heart Disease

Because the predicted probability was below the 0.50 classification threshold, the model assigned this record to class 0.

**This prediction is not a medical diagnosis.** A model output below 0.50 does not rule out heart disease, and the result should not be used to make healthcare decisions.


## 🚀 Future Improvements

- Investigate missing-data patterns and compare complete-case analysis with appropriate imputation methods.
- Use stratified cross-validation and evaluate the model across multiple data splits.
- Investigate categorical variables and potential separation in the Logistic Regression model.
- Compare Logistic Regression with Decision Trees, Random Forest, and XGBoost.
- Evaluate additional metrics, such as the ROC curve and AUC.
- Add clear visualizations and a reproducible analysis report.
- Validate the final model on an independent dataset before making broader performance claims.

## ▶️ How to Run the Project

1. Install [R](https://cran.r-project.org/) and optionally [RStudio](https://posit.co/download/rstudio-desktop/).
2. Clone or download this repository.
3. Place the dataset in the expected location used by the R script.
4. Open the R script in RStudio.
5. Install any required R packages that are not already installed.
6. Update the dataset file path if necessary.
7. Run the script from beginning to end to reproduce the analysis.

**Note:** Update the filenames and package instructions above to match the files actually included in this repository.

## 📚 Key Learnings

- Loading, exploring, and cleaning real-world clinical data using R.
- Handling missing values and understanding the impact of data reduction.
- Performing exploratory data analysis and correlation analysis.
- Building a binary classification model using Logistic Regression.
- Evaluating predictions with a confusion matrix and classification metrics.
- Interpreting model outputs and recognizing limitations in predictive modeling.

## 👩‍💻 Author

**Lavanya Sirigiri**

B.E. — Artificial Intelligence and Data Science

GitHub: [LAVANYA992](https://github.com/LAVANYA992)

---

*Disclaimer: This project is intended for educational purposes only. It is not intended to diagnose, treat, or prevent any disease.*
