setwd("C:/Users/JohnCusack/Documents/GitHub/Cusack_454_Adv_ML")
library(nnet)

df = read.csv("Train_rev1.csv")

head(df)

#create dummy variables for the category of job
unique(df$Category)

category_dummy = nnet::class.ind(df$Category)

df$SalaryNormalized

df2 = data.frame(c(1:nrow(df)))
df2$Salary = df$SalaryNormalized
df2 = cbind(df2,category_dummy)
df2$c.1.nrow.df.. = NULL
head(df2)


set.seed(123)
smp_size <- floor(0.70 * nrow(df2))
train_ind <- sample(seq_len(nrow(df2)), size = smp_size)

train <- df2[train_ind, ]
test <- df2[-train_ind, ]
model = lm(Salary ~ ., data = train)

