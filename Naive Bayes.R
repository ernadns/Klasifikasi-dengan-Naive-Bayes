#Classification with Naive Bayes

library(e1071)

#Next load the titanic dataset
data("Titanic")
Titanic

#Save into a data frame and view it
titanic_df=as.data.frame(Titanic); titanic_df

#Creating data from table
repeating_sequence=rep.int(seq_len(nrow(titanic_df)), titanic_df$Freq);repeating_sequence

#Creating the dataset by row repetition
titanic_dataset=titanic_df[repeating_sequence,]; titanic_dataset

#We no longer need the frequency, drop the feature 
titanic_dataset$Freq=NULL

#Fitting the Naive Bayes Model
naive_bayes_model=naiveBayes(Survived ~., data=titanic_dataset)

#What does the model say? Print the model summary
naive_bayes_model

#Prediction on the dataset 
NB_Predictions=predict(naive_bayes_model, titanic_dataset)

#Confusion matrix to check accuracy 
table(NB_Predictions, titanic_dataset$Survived)
