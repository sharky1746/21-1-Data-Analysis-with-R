# 1인당 전기 생산량 데이터 파일: electricity_generation_per_person.csv 가 업로드된 data에 포함되어 있습니다.
# 화일을 읽어드려 살펴보면, 총65개 국가에 대해 33년 (1985-2016) 동안 1인단 전기 생산량이 기록되어 있짐만, column 이름이 되는 
# [연도] 속성에 X 문자가 의도치 않게 추가되어 있음을 알 수 있습니다.텍스트 인코딩 문제로 가끔 이런 일이 발생합니다.

# Q1. names() 와 substr 수를 사용하면 이를 정리하고, view() 함수룰 사용해 정리된 결과를 볼 수 있도록 코딩하십시오.

elec_gen = read.csv("/Data/electricity_generation_per_person.csv", header = TRUE, sep = ",")
names(elec_gen)
# names(elec_gen) = substr(names(elec_gen), 2, nchar(names(elec_gen)))
# names(elec_gen)

names(elec_gen)[2:length(names(elec_gen))] = substr(names(elec_gen)[2:length(names(elec_gen))], 2, nchar(names(elec_gen)[2:length(names(elec_gen))]))
# names(elec_gen)[2:33] = substr(names(elec_gen)[2:33], 2, nchar(names(elec_gen)[2:33]))
names(elec_gen)
View(elec_gen)

# 같은 방법으로 electricity_use_per_person.csv 파일을 읽어들여, 연도 이름에서 불필요한 문제를 제겋한다.
# 총 138개국의 56년동안 (1960-2014) 1인당 전기사용량이 기록되어 있습니다.

# Q2. names() 와 substr 수를 사용하면 이를 정리하고, view() 함수룰 사용해 정리된 결과를 볼 수 있도록 코딩하십시오.
elec_use = read.csv("D:./Data/electricity_use_per_person.csv", header = TRUE, sep = ",")
names(elec_use)[2:length(names(elec_use))] = substr(names(elec_use)[2:length(names(elec_use))], 2, nchar(names(elec_use)[2:length(names(elec_use))]))
# names(elec_use)[2:56] = substr(names(elec_use)[2:56], 2, nchar(names(elec_use)[2:56]))
View(elec_use)

# View() 는 50개 column만 보여주므로, str(elec_use) 로 구조 확인.
str(elec_use)

# 위 데이터 프레임은 이제까지 다루었던 일반 데이터프레임 구성, 즉 속성 하나를 열 하나에 배치하고, 행 하나가 
# 샘플하나로 채워진 구성이 아니다. 각 측정 연도 값이 열의 이름이 되어 여러 해에 걸친 값이 하나의 행을 구성하고 있다.
# 국가명, 연도, 전기사용량과 소비량을 각각 하나의 열에 대응시키는 변형이 필요합니다.
# "tidyr" package를 사용해, gather() 함수를 사용하면 "year"를 key에, 측정값의 속성이름을 value에
# 지정하는 새로운 데이터 프레임을 구성할 수 있습니다.

# Q3. elec_gen_df, elec_use_df 신 데이터 프레임을 구성하는 코딩을 하고, NA를 포함한 관측치는 제거합니다.
# 2 데이터 프레임을 공통 column이나 row names를 기반으로 merge 하는 코드를 제시하시오.

install.packages("tidyr")
library(tidyr)

elec_gen_df = gather(elec_gen, -country, key = "year", value = "ElectricityGeneration", na.rm=TRUE)
elec_use_df = gather(elec_use, -country, key = "year", value = "ElectricityUse", na.rm=TRUE)
elec_gen_use = merge(elec_gen_df, elec_use_df, all=FALSE)
View(elec_gen_use)

# Q4. gapminder 사이트에서 Home > Resources > Data [download the data] > Education > Literacy 에 있는
# 5종류의 관측 데이터 set과 인터넷에서 literacy_rate_adult_female_percent_of_females_ages_15_above.csv
# (1975-2011) 데이터를 찾아, 결측치가 있는 year는 제외하고, 국가별, 연도별 "adult_female", "adult_male",
# "adult_total", "youth_female", "youth_male", "youth_total" literacy 를 보여주는 코드를 제시핫시오.
# 결과는 543 obs. of 8 variables가 도출될입니다. year에 불필요한 문자나 문자열이 있다면 제거 해야합니다.

lit_adlt_fl = read.csv("./Data/literacy_rate_adult_female_percent_of_females_ages_15_above.csv", header=TRUE, sep=",")
lit_adlt_ml = read.csv("./Data/literacy_rate_adult_male_percent_of_males_ages_15_and_above.csv", header=TRUE, sep=",")
lit_adlt_tot = read.csv("./Data/literacy_rate_adult_total_percent_of_people_ages_15_and_above.csv", header=TRUE, sep=",")

lit_yth_fl = read.csv("./Data/literacy_rate_youth_female_percent_of_females_ages_15_24.csv", header=TRUE, sep=",")
lit_yth_ml = read.csv("./Data/literacy_rate_youth_male_percent_of_males_ages_15_24.csv", header=TRUE, sep=",")
lit_yth_tot = read.csv("./Data/literacy_rate_youth_total_percent_of_people_ages_15_24.csv", header=TRUE, sep=",")


# Q5.[40점] 결측치가 있는 year는 제외하고, 국가별, 연도별 "adult_female", "adult_male",
# "adult_total", "youth_female", "youth_male", "youth_total" 순서로 literacy 를 보여주는 코드를 제시하시오.
# 최종 결과에 불필요한 문자나 문자열이 있다면 제거되어야 합니다. 최종 결과는 550 obs. of 8 variables가 도출됩니다. 

names(lit_adlt_fl)[2:length(names(lit_adlt_fl))] = substr(names(lit_adlt_fl)[2:length(names(lit_adlt_fl))], 2, nchar(names(lit_adlt_fl)[2:length(names(lit_adlt_fl))]))

names(lit_adlt_ml)[2:length(names(lit_adlt_ml))] = substr(names(lit_adlt_ml)[2:length(names(lit_adlt_ml))], 2, nchar(names(lit_adlt_ml)[2:length(names(lit_adlt_ml))]))

names(lit_adlt_tot)[2:length(names(lit_adlt_tot))] = substr(names(lit_adlt_tot)[2:length(names(lit_adlt_tot))], 2, nchar(names(lit_adlt_tot)[2:length(names(lit_adlt_tot))]))

names(lit_yth_fl)[2:length(names(lit_yth_fl))] = substr(names(lit_yth_fl)[2:length(names(lit_yth_fl))], 2, nchar(names(lit_yth_fl)[2:length(names(lit_yth_fl))]))

names(lit_yth_ml)[2:length(names(lit_yth_ml))] = substr(names(lit_yth_ml)[2:length(names(lit_yth_ml))], 2, nchar(names(lit_yth_ml)[2:length(names(lit_yth_ml))]))

names(lit_yth_tot)[2:length(names(lit_yth_tot))] = substr(names(lit_yth_tot)[2:length(names(lit_yth_tot))], 2, nchar(names(lit_yth_tot)[2:length(names(lit_yth_tot))]))

install.packages("tidyr")
library("tidyr")

laf_tidy=gather(lit_adlt_fl, -country, key="year", value="adult_female")
lam_tidy=gather(lit_adlt_ml, -country, key="year", value="adult_male")
lat_tidy=gather(lit_adlt_tot, -country, key="year", value="adult_total")

lyf_tidy=gather(lit_yth_fl, -country, key="year", value="youth_female")
lym_tidy=gather(lit_yth_ml, -country, key="year", value="youth_male")
lyt_tidy=gather(lit_yth_tot, -country, key="year", value="youth_total")

literacy = merge(laf_tidy, lam_tidy)
literacy = merge(literacy, lam_tidy)
literacy = merge(literacy, lat_tidy)
literacy = merge(literacy, lyf_tidy)
literacy = merge(literacy, lym_tidy)
literacy = merge(literacy, lyt_tidy)
literacy = na.omit(literacy)
View(literacy)
summary(literacy)
print(literacy)
str(literacy)
