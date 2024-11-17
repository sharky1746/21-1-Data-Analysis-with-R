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

# 다음 dataset은 유방암 수술을 받은 환자의 생존에 대해 University of Chicago Billings 병원에서
# 1958 년에서 1970년 사이에 수행된 실제 연구 사례가 포함되어 있고, 아래 URL에서 데이터를 읽어올 수 있으며,
# 이는 UCI Repository에 저장되어 있어 관련 정보를 얻을 수 있습니다.

URL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/haberman/haberman.data"

haberman<- read.csv(URL, fileEncoding = "utf-8", header=F)


# Q1.[20점] 주어진 URL로부터 데이터를 읽어드리고, 각 변수에 age, op_year, no_nodes, survival 변수명을 부여한 후,
#	변수의 의미를 설명하고, 독립변수와 종속변수를 구분하십시오.


str(haberman)

names(haberman)=c('age','op_year','no_nodes','survival')
str(haberman)

# Q2.[20점] 주어진 문제에 적절한 full model 회귀모형을 제시하시오.


haberman$survival = factor(haberman$survival)
str(haberman)
h=glm(survival~age+op_year+no_nodes, data = haberman, family = binomial)
coef(h)
deviance(h)

# Q3.[20점] Q2에서 작성한 회귀모델을 사용해, 57세, op_year=1958, no_nodes=5 환자와 
# 66세, op_year=1960, no_nodes=32 인 환자가 입원했을 때, 두 명의 환자에 대해 survival을 예측하고 결과를 설명하시오.

new_patients=data.frame(age=c(57,66), op_year=c(58,60), no_nodes=c(5,32))
predict(h, newdata=new_patients, type='response')

#첫번째 환자는 사망확률이 28.8% 두번쨰환자는 84.0%이다.


# Q4.[20점] Q2에서 모델링에 사용된 독립변수들 모두가 필요한지 분석하고, 
#필요하지 않은 독립변수가 발견되면, reduced model을 제시하시오.

h=glm(survival~age+no_nodes, data=haberman, family=binomial)
coef(h)




# Q5.[20점] Q4에서 reduced model이 발견된다면 두 모델의 설명력이 차이가 있는지 설명하시오.

deviance(h)
#잔차제곱합이 약간 증가했다. 설명력이 떨어졌다고 볼수있다.