# kaggle은 세계 과학자들이 특정 묹제의 해결법을 놓고 경쟁을 벌이는 온라인 플랫폼입니다.
# 한 때 사회적 이슈가 되기도 했던 아보카도 가격폭등이 기록도 Kagggle 데이터가 존재합니다.

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

# Q1.[5점] https://www.kaggle.com/neuromusic/avocado-prices에서 avocado.csv가 압축된 archive.zip을 다운로드하여 채점을 위해 "./Data"에 위치하도록 하십시오.
# 압축화일 archive.zip을 unzip하여 avocado.csv 생성 코드와 이를 "avocado" 데이테프레임 클래스로 읽어들이는 코드를 제시하십시오.
# kaggle 사이트로부터 직접 archive.zip 화일을 다운로드 받는 코드를 작성해 문제를 해결해도 좋습니다.

avacado = read.csv("/Data/avocado.csv", header = TRUE, sep = ",")
str(avacado)

# Q2. [10점] avocado.csv 화일에는 14개의 속성과 18,249 관측치가 있습니다.
# 지역별(region) 총판매량 평균과 평균가격 평균을 요약하는 코드를 1줄로 작성하십시오.
# 총 54개의 region이 있습니다.

avacado_region <- avacados %>% group_by(region) %>% 
  summarize(V_avg=mean(Total.Volume),P_avg=mean(AveragePrice))
avacado_region


# Q3. [10점] 지역별 총 판매량 평균과 평균가격 평균을 연도별로 세분화하는 코드를 1줄로 작성하십시오.

avacado_regionY <- avacados %>% group_by(region, year) %>% 
  summarize(V_avg=mean(Total.Volume),P_avg=mean(AveragePrice))
avacado_regionY

# Q4. [10점] 지역별 총 판매량과 평균가격을 연도별, 유기농 여부로 세분화하는 코드를 1줄로 작성하십시오.

avacado_regionYO <- avacados %>% group_by(region, year, type) %>% 
  summarize(V_avg=mean(Total.Volume),P_avg=mean(AveragePrice))
avacado_regionYO

# Q5.[10점] 지역별 총판매량을 기준으로 판매량 순위, 최대값을 기록한 년도, 최대값을 기록한 지역을 볼 수 있는 코드를 작성하되,
# 결과에서 평균가격, 유기능 여부 속성도 동시에 볼 수 있는 코드 제시하십시오.

arrange(avacado_regionYO, desc(V_avg))

# Q6.[5점] avocado 판매 정보를 이번에는 연도별 평균 대신 월별 평균으로 요약하는 코드를 작성하십시오,

avacado_month <- avacados %>% group_by(region, year, month(Date), type) %>% 
  summarize(V_avg=mean(Total.Volume),P_avg=mean(AveragePrice))
avacado_month








# gapminder는 스웨덴 비영리 통계분석 서비스입니다.
# 유엔의 데이터를 바탕으로 인구 예측, 부의 이동 등에 관한 연구 논문과 통계정보를 공유한다.
# 세계 각국의 기대수명(lifexp), 1인당 국민총생산(GdpPercap), 인구(Pop) 데이터 등을 집계한 것입니다.
# 통계학적 연구에 매유 유용하고, 여로 유형의 데이터가 데이터프레임 형식으로 저장되어 데이터과학 공부에도 유용.

install.packages("gapminder")
library("gapminder")
summary(gapminder)
View(gapminder) 


# Q7.[10점] country 별, 년도별, LifeEx를 보여주는 코드를 작성하십시오.

gapminder[, c("country","year","lifeExp")]

# Q8.[10점] 남한의 년도별 LifeExp와 인구를 보여주는 코드를 작성하십시오.

gapminder[gapminder$country == "Korea, Rep.", c("country", "year","lifeExp","pop")]

# Q9.[10점]. 대륙별, 국가별 LifeExp과 인구를 보여주는 코드를 summarise()함수와 %>% 를 사용해 각각 작성하십시오.

gapminder %>% group_by(continent, country) %>% summarize(lifeExp_avg=mean(lifeExp), pop_avg=mean(pop))

# Q10.[20점]. 1990년 까지 남한과 북한의 각기 평균수명을 보여주는 %>%를 사용해 코드를 작성하고, 
# 1990년 이후부터 현재까지 남한과 북한의 평균수명 각각 보여주는 코드를 작성하시오. 두 개의 결과가 시사하는 바를 설명하시오.

gapminder[gapminder$country=="Korea, Dem. Rep." & gapminder$year<=1990,c("country","year","lifeExp")]
gapminder[gapminder$country== "Korea, Rep." & gapminder$year<=1990,c("country","year","lifeExp")]
gapminder[gapminder$country=="Korea, Dem. Rep."&gapminder$year>1990,c("country","year","lifeExp")]
gapminder[gapminder$country=="Korea, Rep."&gapminder$year>1990,c("country","year","lifeExp")]

#1990년을 기준으로 남한의 평균수명이 북한보다 증가함
