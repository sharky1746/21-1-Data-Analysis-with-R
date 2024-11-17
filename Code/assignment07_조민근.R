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
install.packages("ggpubr")
install.packages("plotly")  
install.packages("xtable") 
install.packages("treemap") 

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
library(ggpubr)
library(plotly)
library(xtable)
library(treemap)



# Q1. [20점] ‘midwest’ 데이터 셋은 미국 중부 지역의 인구분포 정보를 담고 있습니다. midwest 데이터 프레임은 437개 관측치와 28개 속성이 있습니다. midwest data set은 “https://goo.gl/G1K41K” 에서 *.cvs 파일 형태로 읽어올 수 있습니다. 아래 scatter plot을 그리는 R 코드를 작성하십시오

midwest <- read.csv('https://goo.gl/G1K41K', fileEncoding = "utf-8")
str(midwest)
ggplot(midwest, aes(x=area, y=poptotal))+  geom_point(aes(col=state, size =popdensity))+  
  geom_smooth(method="auto",se=F) +  xlim(c(0, 0.1)) +  ylim(c(0, 500000))+   
  labs(subtitle = "Area Vs Population",  y="Population",   x="Area", title = "Scatterplot", 
       caption = "Source : midwest") 

#Q2. [20점] ‘mtcars’ data set은 1974 년 Motor Trend US 잡지에서 발췌했으며 연료 소비량과 자동차 32대의 (1973-74 모델) 자동차 설계 및 성능에 대한 10 가지 속성을 포함하고 있으며, data(mtcars)로 사용할 수 있습니다. 아래와 같은 Lollipop chart를 그리는 R code를 작성하십시오.

data(mtcars)
str(mtcars)
mtcars
dfm <- mtcars
# Convert the cyl variable to a factor
dfm$cyl <- as.factor(dfm$cyl)
# Add the name colums
dfm$name <- rownames(dfm)
# Inspect the data
head(dfm[, c("name", "wt", "mpg", "cyl")])
str(dfm)
dfm
ggdotchart(dfm, x = "name", y = "mpg",
           color = "cyl",                                
           palette = c("#440c53", "#158884", "#fde825"), 
           sorting = "asc", sort.by.groups = TRUE,                      
           add = "segments",                            
           add.params = list(color = "lightgray"), 
           group = "cyl",                                
           dot.size = 4,                                 
           ggtheme = theme_pubclean()
)+ font("x.text",angle=45, size = 8, vjust = 0.5)

#Q3. [20점] ‘economics’ data set은 data(economics) 명렬어를 사용해 얻을 수 있습니다. 아래와 같은 time series data visualization을 보여주는 R code를 제시하십시오.

data(economics)
str(economics)
economics


economics2 <- select(economics,date ,psavert, uempmed)
economics2


economics3 <- melt(economics2, id.vars = "date")
str(economics3)


ggplot(data = economics3, aes(x = date, y = value)) + geom_line(aes(color = variable))



#Q4. [20점] Plotly는 오픈 소스 JavaScript 그래프 라이브러리 plotly.js를 통해 대화 형 웹 기반 그래프를 생성하는 R 패키지입니다. 
#또한 'ggplot2'그래프를 웹 기반 버전으로 쉽게 변환 할 수 있습니다. plotly를 사용하여 동일한 그래프에 markers와 lines을 그릴 수도 있습니다. 
#여기서는 이 기능을 보여주기 위해 rnorm() 로 데이터를 생성합니다. 아래와 같은 data visualization을 보여주는 R code를 제시하십시오.

data1 <- rnorm(100, mean = 10)   
data2 <- rnorm(100, mean = 0)   
data3 <- rnorm(100, mean = -10)   
x <- c(1:100)
data <- data.frame(x, data1, data2, data3)
data
p <- plot_ly(data, x = ~x)%>%   
  add_trace(y = ~data1, name = 'data1',mode = 'lines')%>%             
  add_trace(y = ~data2, name = 'data2', mode = 'lines+markers')%>% 
  add_trace(y = ~data3, name = 'data3', mode = 'markers')
p


#Q5. [20점] 사용할 데이터는 오바마 대통령의 2017년 예산 자료입니다. 
#예산에는 각 기관 내 각 국의 업무에 따라 지출될 금액이 나와 있습니다. 


url <- "https://www.govinfo.gov/content/pkg/BUDGET-2017-DB/csv/BUDGET-2017-DB-2.csv "
outlays <- read.csv(url, stringsAsFactors = FALSE)
view(outlays)

outlays$X2017 <- gsub(",","", outlays$X2017)
view(outlays)

outlays$X2017 <- as.numeric(outlays$X2017)
view(outlays)

spending <- outlays %>% select(Agency.Name, Bureau.Name, Account.Name, X2017) %>%
  group_by(Agency.Name, Bureau.Name, Account.Name) %>%
  summarize(X2017 = sum(X2017, na.rm=FALSE)) %>%
  filter(X2017 > 0)

receipts <- outlays %>% select(Agency.Name, Bureau.Name, Account.Name, X2017) %>%
  group_by(Agency.Name, Bureau.Name, Account.Name) %>%
  summarize(X2017 = sum(X2017, na.rm=FALSE)) %>%
  filter(X2017 < 0) %>%
  mutate(X2017 = abs(X2017))

print(xtable(spending[700:709,]), type="html")

print(xtable(receipts[243:252,]), type="html")


treemap(spending, 
        index=c("Agency.Name","Bureau.Name","Account.Name"), 
        vSize = "X2017",
        type="index", 
        palette = "Reds",  
        title="Spending in President Obama's 2017 Budget",
        fontsize.title = 14 
)

treemap(receipts, #Your data frame object
        index=c("Agency.Name","Bureau.Name","Account.Name"),  
        vSize = "X2017",  
        type="index", 
        palette = "Greens", 
        title="Receipts in President Obama's 2017 Budget", 
        fontsize.title = 14
)
