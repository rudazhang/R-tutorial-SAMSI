# Read in student data
data <- read.csv("student.csv",header=TRUE)

# Print column names
colnames(data)

# Plot student grades against hours studying
plot(data$studytime, data$grade,
     xlab="Hours Spent Studying", ylab="Grade")

# Plot student grades against number of absences
plot(data$absences, data$grade,
     xlab="Number of Absences", ylab="Grade")

### Linear models

# Fit a linear model to hours studying
# i.e., y = grade, x = study_time
model_hours <- lm(grade ~ studytime, data=data)
summary(model_hours)

# Fit a linear model to absences
# i.e., y = grade, x = absences
model_absences <- lm(grade ~ absences, data=data)
summary(model_absences)

# Fit a linear model to both absences and hours studying
# i.e., y = grade, x_1 = absences, x_2 = hours spent studying
model_absences_hours <- lm(grade ~ absences + studytime, data=data)
summary(model_absences_hours)

### Predicting

# Split data into males and females
males <- subset(data,gender=='M')
females <- subset(data,gender=='F')

# Fit a linear model (grades = beta_0+beta_1*studytime) using the male data
model_hours_males <- lm(grade ~ studytime,data=males)
summary(model_hours_males)

# We will predict grades for mesh grid of study hours
hours <- data.frame(studytime=seq(1,4,.1))
# Predict grades based on study hours
predict_model <- predict(model_hours_males,hours)

# Plot the predictions (line) against data for females (dots)
plot(females$studytime, females$grade, xlab = "Hours studying",
     ylab = "Grade", main = "Predicting female grades")
lines(hours$studytime, predict_model)
