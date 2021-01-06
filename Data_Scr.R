
# Packages ----------------------------------------------------------------
#These are the packages we are going to use for data scraping
library(rvest)
library(purrr)
library(xml2) 
library(readr)

# Importing data ----------------------------------------------------------
# For this script I suppose you have created a data frame containing the title of each article's title followed by their URL. Each row title is a sequencial article ID (Article01, Article02 and so on…) on the first CSV row. 

# Importing the file
base <- read.csv(file.choose(), row.names = 1, header= TRUE)

# Pulling out the address of the article
article_general <- as.vector(base[,2])
article_titles <- as.vector(base[,1])

#Cheking if it is a vector
str(article_general)
summary(article_general)
str(article_titles)
summary(article_titles)
View(article_titles)

# Defining Functions ------------------------------------------------------
# These functions will help us  cleaning and processing the texts
# Function for extracting text
extracting_texts <- function(x){
  webpage <- read_html(x)
  text <- html_nodes(webpage,'p') #this "p"should chage depending on file
  text_data <- html_text(text)
  Article <- text_data 
  return(Article)
}
# Function for cleaning texts

clean.and.collapse <- function(x) {
  temp<-gsub("\r?\n|\r", " ", x)
  temp<-str_squish(temp)
  temp<- paste(temp,collapse="\n")
  temp <- as.character(temp)
  return(temp)
}

#Cleaning the text and incrementing dataframe----------------------------------------------------------
# Extracting the text (change number in "[]" according to line)
Article <-extracting_texts (article_general[50])
#Inserting title at the Begging of the text
Article <- prepend(Article, article_titles[50],before = 1) ; View(Article)
#Cleaning the texts
# Delete pre and post-document data / observe the numbers in the text this stemp is only necessary if the function saves some heading information to the file
#Article<- Article[3:16]  
Article <- clean.and.collapse(Article)
# Adding text to the dataframe
# Number in "[]" should change according to the line)
base[50,"Text"] <- Article