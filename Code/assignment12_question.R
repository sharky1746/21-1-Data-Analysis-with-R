# 우리가 많이 다룬 iris를 데이터를 훈련용 데이터로 분석모델을 만들고,
# 만들어진 모델의 적합성을 테스트 데이터로 검정해 보겠습니다.
# iris 데이터에는 모두 150개의 관측치와 5개의 변수가 있습니다.

# Q1. [20점] 150개 관측치에서 random하게 100개를 추출해 train 데이터를 만듭니다.
# 임의로 추출할 때 set.seed(1)로 하고, 100개의 관측치를 갖는 train_data를 만드십시오.

data(iris)
library(MASS)
set.seed(1)


# Q2.[40점] Q1에서 만들어진 100개의 데이터로 종을 판별하는 분석하고 분석 결과의 다음 용어가 의미하는 바를 설명하시오.
# a. Prior probabilities of groups:
# b. Group means:
# c. Coefficients of linear discriminants:


# Q3.[20점] 판별함수식 2개를 구하시오.


# Q4.[20점] 실제값과 예측값이 맞게 분류된 비율을 산출하는 R코드를 제시하시오.









