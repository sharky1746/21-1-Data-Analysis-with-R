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


# Q1: 
# 임의의 20가구에 대헤 연간 소득 및 오락비 지출을 조사하여 단위는 dollar로 Family.txt에 저장하였다.
# 오락비 지출과 연간소득 관련 여부를 알고 싶은 것이 분석의 목적입니다. 다음 질문에 답하시오.
# 단, 데이터가 "./Data/Family.txt"에 있다고 가정하고, 아래와 같이 데이터를 읽어드린다.
# 그러므로, 여러분도 아래와 같이 데이터를 ./Data directory 밑에 두어야 합니다.

FmlyData = read.table("/Data/Family.txt", header=T)
FmlyData



# Q1-1.[5점] 산점도를 그리고, 시각적으로 판단한 관측치의 선형성을 섦명하시오.

plot(FmlyData)
#Recreation와 Income는 양의 선형성을 띈다.

# Q1-2.[5점] 주어진 오락비 지출과 수입 관측치 간 관계를 R 코드를 사용해 linear modeling 한 R 코드와 결과를 제시하십시오.

lm_model <- lm(Income~Recreation,data=FmlyData)
lm_model
summary(lm_model)
#y = 14949.289 + 11.011x + 𝜖
#y : Income
#x : Recreation

abline(lm_model,col="red")


# Q1-3.[30점] Q1-2에서 얻은 결과에서 "회귀모형의 적합성"을 F값의 p-value로 검정하는 이유를 설명하시오.

#t 검정은 표본수가 아주 작은(보통 30이하) 두 실험구간의 평균을 비교할 때 사용하고, F검정은 그 이상의 경우에 활용
#표본의 수가 작은 집단은 정규분포하지 않기 때문에 t검정을 사용
#F-검정의 경우 표본은 평균을 중심으로 정규분포(뒤집은 좌우대칭의 종모양)
#두 집단중 한 집단을 중심으로 다른 집단이 이 종의 95% 범위내에 포함되느냐 안되느냐를 나타냄
# 위험율을 1%로 설계했다면, 실제 99%의 범위내에서 같은 집단으로 보는 것이므로 유의차의 기준이 더욱 엄격해짐
#이때 P<0.01이하가 되어야 통계적 유의차이가 있는 것으로 인정됩니다.
#반대로 5%로 했다면, <0.05로 설정



# Q1-4.[10점] 연간 소득이 $65,000인 가구의 평균 오락비 지출을 추정하고, 95% 신뢰 구간을 구하시오.


confint(lm(Income~Recreation,data=FmlyData),  level = 0.95)   
fitted(lm(Income~Recreation,data=FmlyData))   
predict(lm(Recreation~Income,data=FmlyData), newdata = data.frame(Income = 65000), interval = "prediction")



# Q2:
# 우리가 예제로 많이 사용했던 iris 데이터를 사용합니다. iris에는 150개의 관측치가 있으며,
# Sepal은 꽃받침, Petal은 꽃잎을 말하고, 데이터를 살펴보면 3개의 Species(품종) 있음을 알 수 있습니다.
# 품종 별로 꽃잎 넓이의 차이가 있는지 분석하는 문제입니다.

attach(iris)
iris


# Q2-1. [20점] 품종 별로 꽃잎 넓이의 차이 여부를 분석하기 위해 귀무가설과 대립가설을 설정하시오.

#귀무가설(H0) : 세품종 꽃잎 넓이 평균은 동일하다.
#대립가설(H1) : 세품종중 적어도 한 꽃잎 넓이 평균은 다르다.




# Q2-2. [20점] R 함수를 사용해 분산분석표를 산출하고, 분석분석표에 출현하는 하단의 용어를 설명하시오.
# 분산분석표; 10점, 각 설명 1점.

result <- aov(Petal.Width ~ Species, data =iris)
summary(result)
TukeyHSD(result)
plot(TukeyHSD(result))

#	a. Df: 자유도, 제곱합 내 독립 요소의 수
#	b. Sum Sq: 제곱합,  SS 전체는 데이터의 총 변동
#	c. Mean Sq: 평균 제곱
#	d. F Value: F 통계량
#	e. Pr(>F): p value, 유의확률
#	f. Species: 꽃 종류
#	g. Residuals: 잔차를 의미. 회귀식에 의해 추정된 값과 실제값(입력값)의 차이
#	h. Signif. codes: beta의 유의성 여부에 대해 쉽게 판단할 수 있도록 어떤 표시를 한다는 의미
#	j. 독립변수는 무엇인가? Species
#	k. 종속변수는 무엇인가? Petal.Width


# Q2-3. [10점] 꽃잎 넓이의 평균이 서로 다른 품종 집단을 제시하고, 꽃잎이 넓은 품종부터 좁은 순으로 품종을 나열하시오.

#세품종 모두 유의확률이 매우 작으므로, 세 품종이 모두 평균이 유의미하게 다르다.
#virginica>versicolor>setosa    
	  
	  
detach(iris)
	