# Packages ----------------------------------------------------------------
library(psych)
library(RQDA)
library(dplyr)
library(tidyr)
library(tidyverse)
library(ggcorrplot)
library(GGally)


# Extracting the codes -----------------------------------------------------
openProject("coding.rqda")
codings <-RQDAQuery("select s.name as 'filename', f.name as 'codes' from source s, 
                   coding c, 
                   freecode f where s.id = c.fid and c.cid = f.id and s.status = 1 order by s.name")
codings <- merge(codings, categories, all.y = TRUE)
## Creating a table for the analysis
coding.total <- codings %>% 
  count(codename, filename) %>%
  group_by(filename)%>%
  spread(codename,n)
row.names(coding.total) <- coding.total['filename']
coding.total$filename<-NULL
coding.total$Total <-rowsum(coding.total)
names.columns <- c('NP_II','NP_I','MC_II','ADJ_II','ADJ_III',"Modals",'MC_I',
                   'ADJ_I',"MC_III","Verb")
colnames(coding.total) <- names.columns


# MD analysis -------------------------------------------------------------
## Normalising for 1000
coding.total <- coding.total %>% 
  mutate_at(
    vars(-matches("Total")),
    ~ .x * 1000 / Total
  )

## Calculating
cortest.bartlett(relatives_register2); det(cor(relatives_register2))# Bartlett's test and multi-colinearity test
fa.parallel(relatives_register2, fa="fa", main = "Scree Plot", show.legend=TRUE) #screeplot
factors <- factanal(relatives_register2, 4, rotation="promax") #factor analysis
factor.final <- factors[["loadings"]]
factor.final # Results!!


# Correlation Strategies --------------------------------------------------

correlation<- cor(coding.total)
ggcorrplot(correlation, method = "circle", type = "upper",
           outline.col = "darkgrey",hc.order = TRUE,insig = "blank",show.diag=FALSE,sig.level=0.05,legend.title = "Corr.",ggtheme=ggplot2::theme_minimal())



# Functions per newspaper -------------------------------------------------

#Calculating the score for each file
fit <- principal(relatives_register2, 
                 nfactors=4, rotate="varimax")
scores.files <- as.data.frame(fit[["scores"]])

# Preparing the dataframe for plotting
daily <- rep("D", 50)
sun <- rep("S", 21)
telegraph <-rep("T",27)
newspaper <-c(daily,sun,telegraph)
scores.files <-cbind(newspaper,scores.files)
daily.av <- subset(scores.files, newspaper=="D", -newspaper)
tel.av <- subset(scores.files, newspaper=="T", -newspaper)
sun.av <- subset(scores.files, newspaper=="S", -newspaper)
D <- t(colMeans(daily.av, na.rm = TRUE))
S <- t(colMeans(sun.av, na.rm = TRUE))
Te <- t(colMeans(tel.av, na.rm = TRUE))
newspaper <-c("Daily Star", "Sun", "Telegraph")
dimentions <-c("D1", "D2", "D3","D4")
general.means <- as.data.frame(rbind(D,S,Te), row.names = newspaper,
                               col.names=dimentions)
colnames(general.means) <- dimentions

##Plotting
devtools::install_github("ricardo-bion/ggradar", 
                        dependencies = TRUE)
library(ggradar)
library(dplyr)
library(scales)
library(tibble)

filename <- c("Daily Star", "Sun", "Telegraph")
radar1 <- general.means %>% 
  as_tibble(rownames = "filename") %>% 
  mutate_at(vars(-filename), rescale)
ggradar(radar1)










