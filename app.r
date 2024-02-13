# نصب و فراخوانی کتابخانه caret (اگر قبلا نصب نشده باشد)
# install.packages("caret")
# install.packages("datasets")
library(caret)
library(datasets)
# install.packages("vscDebugger")

# خواندن مجموعه داده iris
data(iris)

# تقسیم داده به دو بخش: آموزش و آزمون
set.seed(123)
splitIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
train_data <- iris[splitIndex, ]
test_data <- iris[-splitIndex, ]

# ایجاد یک مدل تصمیم‌گیری
model <- train(Species ~ ., data = train_data, method = "rpart")

# پیش‌بینی بر روی داده‌های آزمون
predictions <- predict(model, newdata = test_data)

# ارزیابی مدل
confMatrix <- confusionMatrix(predictions, test_data$Species)

# چاپ ماتریس اشتباهات
print(confMatrix)

# چاپ اطلاعات دقت
print(confMatrix$overall["Accuracy"])

