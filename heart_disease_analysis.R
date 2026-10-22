setwd("C:/Users/lavan/Downloads/heart_disease_analysis_casestudy")
data <- read.csv("heart_disease_uci.csv")
head(data)
tail(data)
dim(data)
names(data)
str(data)
summary(data)
colSums(is.na(data))
data <- na.omit(data)
colSums(is.na(data))
sum(duplicated(data))
data <- data[!duplicated(data), ]
sum(duplicated(data))
table(data$num)
data$HeartDisease <- ifelse(data$num == 0, 0, 1)
table(data$HeartDisease)
prop.table(table(data$HeartDisease)) * 100
install.packages("ggplot2")
library(ggplot2)
ggplot(data, aes(x = age)) +
  geom_histogram(bins = 20,fill="steelblue",color='black') +
  labs(
    title = "Age Distribution of Patients",
    x = "Age",
    y = "Number of Patients"
  ) +
  theme_minimal()
ggplot(data, aes(x = sex)) +
  geom_bar(fill='lightblue',color='black') +
  labs(
    title = "Gender Distribution of Patients",
    x = "Gender",
    y = "Number of Patients"
  ) +
  theme_minimal()
ggplot(data, aes(x = factor(HeartDisease))) +
  geom_bar(fill="pink",color='black') +
  labs(
    title = "Heart Disease Distribution",
    x = "Heart Disease",
    y = "Number of Patients"
  ) +
  theme_minimal()
ggplot(data, aes(
  x = factor(HeartDisease),
  y = age
)) +
  geom_boxplot(fill='lightpink') +
  labs(
    title = "Age vs Heart Disease",
    x = "Heart Disease",
    y = "Age"
  ) +
  theme_minimal()
ggplot(data, aes(
  x = factor(HeartDisease),
  y = chol
)) +
  geom_boxplot() +
  labs(
    title = "Cholesterol vs Heart Disease",
    x = "Heart Disease",
    y = "Cholesterol"
  ) +
  theme_minimal()
ggplot(data, aes(
  x = factor(HeartDisease),
  y = trestbps
)) +
  geom_boxplot(fill='blue') +
  labs(
    title = "Resting Blood Pressure vs Heart Disease",
    x = "Heart Disease",
    y = "Resting Blood Pressure"
  ) +
  theme_minimal()
ggplot(data, aes(x = cp, fill = factor(HeartDisease))) +
  geom_bar(fill='lightpink',color='black') +
  labs(
    title = "Chest Pain Type and Heart Disease",
    x = "Chest Pain Type",
    y = "Number of Patients",
    fill = "Heart Disease"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
ggplot(data, aes(x = factor(fbs), fill = factor(HeartDisease))) +
  geom_bar(fill='lightgreen',color='black') +
  labs(
    title = "Fasting Blood Sugar and Heart Disease",
    x = "Fasting Blood Sugar",
    y = "Number of Patients",
    fill = "Heart Disease"
  ) +
  theme_minimal()
numeric_data <- data[, c(
  "age",
  "trestbps",
  "chol",
  "thalch",
  "oldpeak",
  "HeartDisease"
)]
cor(numeric_data, use = "complete.obs")
install.packages("corrplot")
library(corrplot)
corrplot(
  cor(numeric_data, use = "complete.obs"),
  method = "color",
  type = "upper",
  addCoef.col = "blue"
)
colSums(is.na(data))
data_clean <- na.omit(data)
colSums(is.na(data_clean))
data_clean$sex <- as.factor(data_clean$sex)
data_clean$cp <- as.factor(data_clean$cp)
data_clean$fbs <- as.factor(data_clean$fbs)
data_clean$restecg <- as.factor(data_clean$restecg)
data_clean$exang <- as.factor(data_clean$exang)
data_clean$slope <- as.factor(data_clean$slope)
data_clean$thal <- as.factor(data_clean$thal)
str(data_clean)
install.packages("caret")
library(caret)
set.seed(123)
train_index <- createDataPartition(
  data_clean$HeartDisease,
  p = 0.80,
  list = FALSE
)
train_data <- data_clean[train_index, ]
test_data <- data_clean[-train_index, ]
dim(train_data)
dim(test_data)
model <- glm(
  HeartDisease ~ age + sex + cp + trestbps + chol +
    fbs + restecg + thalch + exang + oldpeak +
    slope + ca + thal,
  data = train_data,
  family = binomial
)
summary(model)
probabilities <- predict(
  model,
  newdata = test_data,
  type = "response"
)
predictions <- ifelse(probabilities >= 0.5, 1, 0)
head(probabilities)
head(predictions)
confusionMatrix(
  factor(predictions),
  factor(test_data$HeartDisease),
  positive = "1"
)
new_patient <- data.frame(
  age = 55,
  sex = factor("Male", levels = levels(data_clean$sex)),
  cp = factor("asymptomatic", levels = levels(data_clean$cp)),
  trestbps = 140,
  chol = 250,
  fbs = factor("FALSE", levels = levels(data_clean$fbs)),
  restecg = factor("normal", levels = levels(data_clean$restecg)),
  thalch = 150,
  exang = factor("FALSE", levels = levels(data_clean$exang)),
  oldpeak = 1.0,
  slope = factor("flat", levels = levels(data_clean$slope)),
  ca = 0,
  thal = factor("normal", levels = levels(data_clean$thal))
)
new_patient
probability <- predict(
  model,
  newdata = new_patient,
  type = "response"
)
probability
prediction <- ifelse(probability >= 0.5, 1, 0)
ifelse(
  prediction == 1,
  "Heart Disease Present",
  "No Heart Disease"
)