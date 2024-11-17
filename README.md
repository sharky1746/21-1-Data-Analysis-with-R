# Data Analysis with R Projects

안녕하세요!  
이 레포지토리는 **Data Analysis with R** 수업에서 진행한 과제와 프로젝트를 정리한 공간입니다.  
R 프로그래밍 언어를 활용한 데이터 분석, 시각화, 통계 모델링 및 다양한 데이터 과학 기술을 학습하고 실습한 결과물을 공유합니다.

---

## 수업 개요
- R 프로그래밍 기본 학습: 변수, 자료 구조, 조건문, 반복문, 함수 작성
- 데이터 시각화: ggplot2와 기본 그래픽스를 사용한 다변량 데이터 시각화
- 통계 분석 및 모델링: 선형 회귀, 가설 검정, 분산 분석
- 데이터 마이닝 및 예측 모델링: 의사결정나무, 랜덤포레스트, 로지스틱 회귀
- 외부 데이터 처리: CSV 및 기타 데이터 소스에서 데이터 로드, 병합 및 정렬

---

## 주요 개념
### 1. R Basics
- 데이터 구조: 벡터, 리스트, 행렬, 데이터 프레임
- 데이터 처리: dplyr 패키지를 활용한 필터링, 요약, 정렬

### 2. 데이터 시각화
- **ggplot2**: 데이터를 효과적으로 표현하기 위한 다양한 플롯 생성
- **Treemap, Boxplot, Histogram**: 데이터 분포와 패턴 이해를 위한 그래프

### 3. 통계 분석
- **회귀 분석**: 독립 변수와 종속 변수 간의 관계 분석
- **가설 검정**: 데이터의 유의미한 차이 검증
- **분산 분석(ANOVA)**: 다중 그룹 간 평균 비교

### 4. 데이터 마이닝 및 머신러닝
- **의사결정나무**: 데이터를 기반으로 의사결정을 시각화
- **랜덤포레스트**: 예측 정확도를 향상시키는 앙상블 모델
- **로지스틱 회귀**: 이진 분류 문제 해결

---

## 주요 프로젝트
### 1. 데이터 시각화
- **목적**: ggplot2를 활용하여 데이터를 시각적으로 표현
- **구현**:
  - 경제 데이터로 시간별 소비 및 실업률 추세 분석
  - Treemap을 통해 예산 데이터의 지출 및 수입 시각화
- **결과**: 데이터의 주요 패턴과 트렌드를 직관적으로 확인

### 2. Iris 데이터 분석
- **목적**: Iris 데이터셋을 사용한 꽃의 종류 분류
- **구현**:
  - Boxplot, Histogram으로 데이터 분포 확인
  - Petal.Length 속성을 기준으로 종별 특징 분석
- **결과**: 데이터의 분류 정확도와 주요 속성 간의 관계 도출

![image](https://github.com/user-attachments/assets/622e2cce-2ef9-4d4d-bae1-f64b432da394)

### 3. 뉴욕 공기질 데이터 분석
- **목적**: 미국 뉴욕의 공기질 데이터를 활용해 시각화
- **구현**:
  - `library(datasets)`와 `data(airquality)` 명령어를 사용해 데이터 로드
  - R 기본 플롯과 ggplot2를 활용하여 다음 그래프 생성:
    1. 월별 오존 농도의 상자 그림(Boxplot)
       
![image](https://github.com/user-attachments/assets/519ec787-8006-418a-bb2c-07eab50eb476)

    2. 온도와 오존 간의 관계를 나타내는 산점도(Scatterplot)
    
![image](https://github.com/user-attachments/assets/f1a27155-6efd-4d20-8cc1-9d00144c9e0a)

  - 결측값 처리 및 데이터 정규화
- **결과**:
  - 공기질의 주요 변수(온도, 오존, 바람 등) 간의 관계 시각화
  - 월별 오존 농도 분포 분석 및 이상치 탐지


### 4. Titanic 데이터 분석
- **목적**: Titanic 승객 데이터로 생존 여부 예측
- **구현**:
  - 의사결정나무 및 랜덤포레스트 모델 생성
  - Confusion Matrix를 활용한 모델 성능 평가
- **결과**: 모델의 예측 정확도 비교 및 최적 모델 도출

  의사결정나무 생성
![image](https://github.com/user-attachments/assets/2cb5289c-5313-4d58-8bbd-4936d0f531d4)


### 5. Midwest 데이터셋 분석
- **목적**: 미국 중부 지역의 인구분포 데이터 분석
- **구현**:
  - `https://goo.gl/G1K41K`에서 데이터를 읽어와 scatter plot 생성
  - 다양한 인구 통계 데이터를 기반으로 데이터 시각화
- **결과**: 인구 밀도와 특정 인종의 비율 간의 관계 시각화

  ![image](https://github.com/user-attachments/assets/a87f6022-ea85-4841-9a6f-f8ffc84bd8c1)


### 6. mtcars 데이터셋 분석
- **목적**: 자동차 연료 소비 및 성능 데이터 분석
- **구현**:
  - Lollipop Chart를 통해 자동차 모델별 연료 소비량 시각화
- **결과**: 시각적으로 명확한 연료 소비량 비교

  ![image](https://github.com/user-attachments/assets/d7d2e038-c299-4a6c-8c62-d43d0483f9fe)


### 7. Economics 데이터셋 분석
- **목적**: 경제 지표 데이터를 활용한 시계열 데이터 시각화
- **구현**:
  - `data(economics)` 데이터셋을 기반으로 ggplot2를 사용한 시계열 그래프 생성
- **결과**: 개인소비지출(pce) 및 실업률(unemploy) 등 주요 경제 지표의 변화 추세를 확인

  ![image](https://github.com/user-attachments/assets/3e53a680-1216-4dba-a84e-6fd8239d0f7c)


### 8. Plotly를 활용한 데이터 시각화
- **목적**: rnorm() 함수로 생성된 데이터를 활용한 인터랙티브 시각화
- **구현**:
  - Plotly 패키지를 사용해 markers와 lines가 결합된 그래프 생성
- **결과**: 동적 데이터 시각화를 통해 데이터 간의 관계를 명확히 표현

  ![image](https://github.com/user-attachments/assets/0d1a75a2-7b4f-4ff8-a38a-c834ba4a1709)


### 9. 2017 오바마 예산 데이터 분석
- **목적**: 예산 데이터를 기반으로 Treemap 생성
- **구현**:
  - 데이터 정리 및 처리: 쉼표 제거, 음수 값 처리, dplyr로 그룹화 및 합산
  - Treemap 생성: 지출(spending)과 수익(income)을 별도로 시각화
- **결과**: 정부 예산의 지출 및 수입 항목을 시각적으로 명확히 나타냄

  ![image](https://github.com/user-attachments/assets/65903b43-4293-4538-806b-bda8f888764a)
  ![image](https://github.com/user-attachments/assets/b86b2d8d-b573-4a35-be46-0fc8949b90ec)



### 10. 자연어 처리 프로젝트
- **목적**: 대통령 연설문 분석
- **구현**:
  - 형태소 분석 및 DTM/TDM 생성
  - 단어 빈도 분석 및 Word Cloud 생성
- **결과**: 연설문의 주요 단어 및 의미적 차이 시각화

대통령이 사용한 상위 20개 단어로 bar chart로 제시
![image](https://github.com/user-attachments/assets/3433f18f-0940-45ef-9361-b586a9498092)

대통령 연설문 treeMap 생성
![image](https://github.com/user-attachments/assets/50779f21-89d2-49ab-a777-8921a161ef32)

대통령 연설문을 word cloud로 비교
![image](https://github.com/user-attachments/assets/7098676e-ce50-4602-ada3-26f07e6081fe)

대통령이 사용한 공통단어 피라미드 그래프를 생성
![image](https://github.com/user-attachments/assets/78e39a0c-0fda-4ef8-ad2d-5818619c92d2)




---

## 활용 기술
- **프로그래밍 언어**: R
- **데이터 시각화**: ggplot2, Treemap, Plotly
- **통계 분석**: 회귀 분석, ANOVA, 가설 검정
- **머신러닝**: 의사결정나무, 랜덤포레스트, 로지스틱 회귀
- **자연어 처리**: KoNLP, NLP4kec

---

이 레포지토리는 R을 활용한 데이터 분석 및 시각화, 머신러닝 기술 실습을 통해 배운 내용을 공유하기 위한 공간입니다.  
**피드백**이나 **협업 제안**은 언제든 환영합니다! 😊
