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


#Q1. [50점] 
useSejongDic()


filePath1 <- "/Data/추미애2021년 신년사.txt"
text1 <- readLines(filePath1,encoding = "Euc-kr")
text1

word_data1 <- extractNoun(text1)
word_data1
undata1 <- unlist(word_data1)
undata1
word_table1 <- table(undata1)
word_table1
undata1 <- Filter(function(x){ nchar(x) > 1 }, undata1)
undata1
word_table1 <- table(undata1) # undata2의 빈도 확인 후 word_table2 변수에 할당당
word_table1
sort(word_table1, decreasing = T)
display.brewer.all()  # 워드클라우드에 쓸 색상 리스트
palette <- brewer.pal(9,"Spectral")
wordcloud(names(word_table1),    freq = word_table1 ,   # 빈도
          min.freq = 2,            # 최소 단어 빈도
          max.words = 200,        # 표현 단어 수
          random.order = F,        # 고빈도 단어 중앙 배치
          rot.per = .1,            # 회전 단어 비율
          scale = c(4, 0.3),        # 단어 크기 범위
          colors = palette) 

filePath2 <- "/Data/윤석열2021년신년사.txt"
text2 <- readLines(filePath2,encoding = "Euc-kr")
text2
word_data2 <- extractNoun(text2)
word_data2
undata2 <- unlist(word_data2)
undata2
word_table2 <- table(undata2)
word_table2
undata2 <- Filter(function(x){ nchar(x) > 1 }, undata2)
undata2
word_table2 <- table(undata2) # undata2의 빈도 확인 후 word_table2 변수에 할당당
word_table2
sort(word_table2, decreasing = T)
wordcloud(names(word_table2),  freq = word_table2 ,   # 빈도
          min.freq = 2,            # 최소 단어 빈도
          max.words = 200,        # 표현 단어 수
          random.order = F,        # 고빈도 단어 중앙 배치
          rot.per = .1,            # 회전 단어 비율
          scale = c(4, 0.3),        # 단어 크기 범위
          colors = palette) 

#a.	[25점] ‘추미애2021년 신년사’로 wordcloud를 만들고, 만들어진 클라우드 결과를 해석하십시오.
# 국민 6회, 법무부 4회 여러분 4회, 인권 4회 순으로 명사들이 나열되었다.
#b.	[25점] ‘윤석열2021년 신년사’로 wordcloud를 만들고, 만들어진 클라우드 결과를 해석하십시오.
# 검찰 24회, 국민 14회, 변화 7회, 형사 7회 순으로 명사들이 나열되었다.



#Q2. [50점] 
useNIADic()

filePath3 <- "/Data/추미애2021년 신년사.txt"
text3 <- readLines(filePath3,encoding = "Euc-kr")
text3

word_data3 <- extractNoun(text3)
word_data3
undata3 <- unlist(word_data3)
undata3
word_table3 <- table(undata3)
word_table3
undata3 <- Filter(function(x){ nchar(x) > 1 }, undata3)
undata3
word_table3 <- table(undata3) # undata2의 빈도 확인 후 word_table2 변수에 할당당
word_table3
sort(word_table3, decreasing = T)
wordcloud(names(word_table3),    freq = word_table3 ,   # 빈도
          min.freq = 2,            # 최소 단어 빈도
          max.words = 200,        # 표현 단어 수
          random.order = F,        # 고빈도 단어 중앙 배치
          rot.per = .1,            # 회전 단어 비율
          scale = c(4, 0.3),        # 단어 크기 범위
          colors = palette) 

filePath4 <- "/Data/윤석열2021년신년사.txt"
text4 <- readLines(filePath4,encoding = "Euc-kr")
text4
word_data4 <- extractNoun(text4)
word_data4
undata4 <- unlist(word_data4)
undata4
word_table4 <- table(undata4)
word_table4
undata4 <- Filter(function(x){ nchar(x) > 1 }, undata4)
undata4
word_table4 <- table(undata4) 
word_table4
sort(word_table4, decreasing = T)
wordcloud(names(word_table4),  freq = word_table4 ,   # 빈도
          min.freq = 2,            # 최소 단어 빈도
          max.words = 200,        # 표현 단어 수
          random.order = F,        # 고빈도 단어 중앙 배치
          rot.per = .1,            # 회전 단어 비율
          scale = c(4, 0.3),        # 단어 크기 범위
          colors = palette) 

#a.	[25점] ‘추미애2021년 신년사’로 wordcloud를 만들고, 다른 사전을 사용하니 무엇이 왜 달라졌습니까?
#차이가 없다

#b.	[25점] ‘윤석열2021년 신년사’로 wordcloud를 만들고, 다른 사전을 사용하니 무엇이 왜 달라졌습니까?
#차이가 없다