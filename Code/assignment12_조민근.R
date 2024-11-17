install.packages("repr")
install.packages("gridExtra")
install.packages("ggthemes")
install.packages("data.table")
install.packages("readr")
install.packages("textclean")
install.packages("fuzzyjoin")
install.packages("lubridate")
install.packages("ggrepel")
install.packages("ggthemes")
install.packages("chron")
install.packages("reshape2")
install.packages("readxl")
install.packages("wordcloud2")
install.packages("rJava")
install.packages("remotes")
install.packages("nord")
if("stringr" %in% installed.packages("stringr") == FALSE)install.packages("stringr")
if("KoNLP" %in% installed.packages("KoNLP") == FALSE)install.packages("KoNLP")
if("wordcloud" %in% installed.packages("wordcloud") == FALSE)install.packages("wordcloud")
if("RColorBrewer" %in% installed.packages("RColorBrewer") == FALSE)install.packages("RColorBrewer")
remotes::install_github('haven-jeon/KoNLP',upgrade = "never", INSTALL_opts=c("--no-multiarch"))
devtools::install_github("lchiffon/wordcloud2")
require(devtools)
install_github("lchiffon/wordcloud2")

library(devtools)
library(gapminder)
library(tidyverse) 
library(datasets)
library(dplyr)
library(ggplot2)
library(knitr)
library(repr)
library(gridExtra)
library(ggthemes)
library(data.table)
library(readr)
library(textclean)
library(fuzzyjoin)
library(lubridate)
library(ggrepel)
library(ggthemes)
library(chron)
library(reshape2)
library(readr) 
library(data.table)
library(purrr)
library(readxl)
library(KoNLP)
library(wordcloud)
library(wordcloud2)
library(stringr)
library(KoNLP)
library(RColorBrewer)

# 우리가 많이 다룬 iris를 데이터를 훈련용 데이터로 분석모델을 만들고,
# 만들어진 모델의 적합성을 테스트 데이터로 검정해 보겠습니다.
# iris 데이터에는 모두 150개의 관측치와 5개의 변수가 있습니다.



# Q1. [20점] 150개 관측치에서 random하게 100개를 추출해 train 데이터를 만듭니다.
# 임의로 추출할 때 set.seed(1)로 하고, 100개의 관측치를 갖는 train_data를 만드십시오.

data(iris)
library(MASS)
set.seed(1)

iris
train <- sample(1:150, 100) 
train



# Q2.[40점] Q1에서 만들어진 100개의 데이터로 종을 판별하는 분석하고 
#분석 결과의 다음 용어가 의미하는 바를 설명하시오.

(ld <- lda(formula = Species ~ ., data = iris, subset = train))



# a. Prior probabilities of groups:
#LDA 분석 이전 확률은 setosa, versicolor, virginca 는 학습 데이터에 존재하는 비율로 
#각각  0.33 ,  0.31 ,  0.36 으로 산정됨을 알 수 있습니다.


# b. Group means: 집단별 독립변수 X의 평균

# c. Coefficients of linear discriminants:

# LDA분석으로 계산된 판별함수식의 계수
#LD1, LD2 총 2개의 판별함수식이 만들어짐을 확인할 수 있습니다.




# Q3.[20점] 판별함수식 2개를 구하시오.

#LD1    LD2 
#0.9912 0.0088 



# Q4.[20점] 실제값과 예측값이 맞게 분류된 비율을 산출하는 R코드를 제시하시오.


predict(ld, iris[-train,])$class
predict(ld, iris[-train,])$posterior
(tt <- table(iris$Species[-train], predict(ld, iris[-train,])$class))
sum(tt[row(tt) == col(tt)])/sum(tt) #정분류율
plot(ld, dimen = 2)


