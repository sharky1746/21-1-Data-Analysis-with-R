# Q1. airquality 데이터에서 바람이 가장 세게 몰아친 날짜를 찾는 R코드를 제시하십시오.
#	가장 바람이 강했던 관측치 행을(tuple) 찾아, 이 관측치의 Month와 Day를 추출한다.
airquality[which.max(airquality$Wind),c("Month","Day")]

# Q2. airquality 데이터에는 포함되어 있는 NA (Not Available) 값을 count는 R 코드를 제시하십시오.
#	Month와 Day 변수는 관측치가 아닌 일자이므로, NA 값이 없다는 가정 하에 이외 모든 변수는 NA 값을 가질 수 있다.
#	그러나, 관측치는 Ozone, Solar.R, Wind, Temp 변수 동시에 NA 값을 가질 수 있으므로 이를 제외하는 것이 타당하다.
count(subset(airquality, is.na(Ozone)| is.na(Solar.R) | is.na(Wind) | is.na(Temp))

