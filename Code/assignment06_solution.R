# Kaggle은 세계 과학자들이 특정 묹제의 해결법을 놓고 경쟁을 벌이는 온라인 플랫폼입니다.
# 한 때 사회적 이슈가 되기도 했던 아보카도 가격폭등이 기록도 Kagggle 데이터가 존재합니다.

# Q1.[5점] https://www.kaggle.com/neuromusic/avocado-prices에서 avocado.csv가 압축된 archive.zip을 다운로드하여 채점을 위해 "./Data"에 위치하도록 하십시오.
# 압축화일 archive.zip을 unzip하여 avocado.csv 생성 코드와 이를 "avocado" 데이테프레임 클래스로 읽어들이는 코드를 제시하십시오.

unzip(zipfile = "./Data/archive.zip", exdir = "./Data")
avocado <- read.csv("D:./Data/avocado.csv", header=TRUE, sep = ",")

# Q2. [10점] avocado.csv 화일에는 14개의 속성과 18,249 관측치가 있습니다.
# 지역별(region) 총판매량 평균과 평균가격 평균을 요약하는 코드를 1줄로 작성하십시오.
# 총 54개의 region이 있습니다.
library("dplyr")
(x_avg <- avocado %>% group_by(region) %>% summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice)))
View(x_avg)

# Q3. [10점] 지역별 총 판매량 평균과 평균가격 평균을 연도별로 세분화하는 코드를 1줄로 작성하십시오.
(x_avg <- avocado %>% group_by(region, year) %>% summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice)))
View(x_avg)

# Q4. [10점] 지역별 총 판매량과 평균가격을 연도별, 유기농 여부로 세분화하는 코드를 1줄로 작성하십시오.
(x_avg <- avocado %>% group_by(region, year, type) %>% summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice)))
View(x_avg)

# Q5.[10점] 지역별 총판매량을 기준으로 판매량 순위, 최대값을 기록한 년도, 최대값을 기록한 지역을 볼 수 있는 코드를 작성하되,
# 결과에서 평균가격, 유기능 여부 속성도 동시에 볼 수 있는 코드 제시하십시오.

# 최대값을 검색할 때는 max 함수를 사용해도 되지만 region 속성 값을 확인할 수 있는 arrange 함수를 사용하는 것이 안전하다.
arrange(x_avg, desc(V_avg))

# 그런데, 1-4위 TotalUS 데이터는 관측치가 아닌 총합입니다.
# 데이터 셋에 이런 중간 통계값이 포함된 경우도 있으므로 주의가 필요합니다.
x_avg1 <- x_avg %>% filter(region != "TotalUS")

# TotalUS를 제외하고 나면 통계 함수를 직접 사용하여 처리할 수 있음. 
x_avg1[x_avg1$V_avg == max(x_avg1$V_avg), ]

# Q6.[5점] avocado 판매 정보를 이번에는 연도별 평균 대신 월별 평균으로 요약하는 코드를 작성하십시오,


# Date형 속성인 Data에서 month를 추출하려면 lubricate 라이브러리에서 제공하는 month 함수를 사용한다.
install.packages("lubridate")
library(lubridate)

(x_avg = avocado %>% group_by(region, year, month(Date), type) %>% summarize(V_avg = mean(Total.Volume), P_avg = mean(AveragePrice)))


# gapminder는 스웨덴 비영리 통계분석 서비스입니다.
# 유엔의 데이터를 바탕으로 인구 예측, 부의 이동 등에 관한 연구 논문과 통계정보를 공유한다.
# 세계 각국의 기대수명(lifexp), 1인당 국민총생산(GdpPercap), 인구(Pop) 데이터 등을 집계한 것입니다.
# 통계학적 연구에 매유 유용하고, 여로 유형의 데이터가 데이터프레임 형식으로 저장되어 데이터과학 공부에도 유용.
install.packages("gapminder")
library(gapminder) 
library(dplyr)
glimpse(gapminder)


# Q7.[10점] country 별, 년도별, LifeExp를 보여주는 코드를 작성하십시오.
gapminder[, c("country", "year", "lifeExp")]


# Q8.[10점] 남한의 년도별 LifeExp와 인구를 보여주는 코드를 작성하십시오.
gapminder[gapminder$country == "Korea, Rep.", c("year", "lifeExp","pop")]


# Q9.[10점]. 대륙별, 국가별 LifeExp과 인구를 보여주는 코드를 summarise()함수와 %>% 를 사용해 각각 작성하십시오.

# group_by 함수를 이용하면 데이터프레임에 포함된 범주형 속성을 활용해 전체 데이터를 그룹으로 분류할 수 있다.
summarise(group_by(gapminder, continent, country), lifeExp_avg = mean(lifeExp), pop_avg = mean(pop))

# dplyr 라이브러리는 데이터가공에 특화된 만큼 반복적인 가공 작업의 수고를 덜기 위해
# 특별한 연산자를 제공한다. 학습하였다시피, 일련의 가공작업을 연결하는 %>% 연산자입니다.
# 연산자는 앞의 명령어를 처리한 결과를 다음 명령어로 전달하는 역할을 한다.
gapminder %>% group_by(continent, country) %>% summarise(lifeExp_avg = mean(lifeExp), pop_avg = mean(pop))

# 한 명령어로 처리한 결과를 다시 다른 명령어로 처리하려면 아래와 같이 중간결과를 변수로 저장한 후 처리하는 것이
# 보통이나, %>% 연산자를 이용하면 일련의 처리과정을 매끄럽게 연결할 수 있다.
temp1 = filter(gapminder, country == "Korea, Dem. Rep.")  
temp1 = filter(gapminder, country == "Korea, Rep.")      
temp2 = select(temp1, country, year, lifeExp)  
temp3 = apply(temp2[ , c("lifeExp")], 2, mean)
temp3

# Q10.[20점]. 1990년 까지 남한과 북한의 각기 평균수명을 보여주는 %>%를 사용해 코드를 작성하고, 
# 1990년 이후부터 현재까지 남한과 북한의 평균수명 각각 보여주는 코드를 작성하시오. 두 개의 결과가 시사하는 바를 설명하시오.
subset(gapminder, year < 1990 & country == "Korea, Rep.", select = c(country, lifeExp)) %>% summarize(avg_lifeExp = mean(lifeExp))
subset(gapminder, year < 1990 & country == "Korea, Dem. Rep.", select = c(country, lifeExp)) %>% summarize(avg_lifeExp = mean(lifeExp))

subset(gapminder, year > 1990 & country == "Korea, Rep.", select = c(country, lifeExp)) %>% summarize(avg_lifeExp = mean(lifeExp))
subset(gapminder, year > 1990 & country == "Korea, Dem. Rep.", select = c(country, lifeExp)) %>% summarize(avg_lifeExp = mean(lifeExp))

통계적으로 분석하더라도 산업화 효과가 본격적으로 발생하기 전인 1990년 이전에는 북한 주민의 평균 수명이 남한 주민의 평균 수명보다 길었으나,
경제발전으로 의료기술 발전, 의료보험 실시 등 다양한 요인으로 인해 1990년 이후에는 남한 주민의 평균 수명이 북한 주민보다 길어졌음을 알 수 있습니다.

# gapminder %>% filter(country == "Korea, Rep.") %>% select(country, year, lifeExp) %>% summarise(lifeExp_avg = mean(lifeExp))
# gapminder %>% filter(country == "Korea, Dem. Rep.") %>% select(country, year, lifeExp) %>% summarise(lifeExp_avg = mean(lifeExp))