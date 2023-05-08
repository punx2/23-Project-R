# 장우찬

## 2023.05.04
### 1. 사각 박스 그리기

``` R
# 사각 박스 그래프 그리기
install.packages('ggplot2')
library(ggplot2)
# 다른 라이브러리의 값을 넣을 땐 
# 아래처럼 달러 표시로 어떤 라이브러리의 값인지 정의
boxplot(iris$Petal.Length~iris$Species, data=iris, main='품종별 꽃잎의 길이', col=c('green','yellow','blue'))
```
 
 ### 2. 산점도
 - 다중변수 데이터에서 두 변수에 포함된 값들을 `2차원` 그래프상에 `점`으로 표현하여 분포를 관찰 할 수 있도록 하는 도구 

``` R
# plot을 이용한 산점도 그리기
mtcars # 데이터 프레임
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt, mpg, main='중량-연비 그래프'
     , xlab='중량', ylab='연비(MPG)', col='red', pch=19)  # x축:중량, y축:연비(MPG)
     # pch : 점의 모양 0~25의 모양을 선택 할 수 있음

# 여러 변수들 간의 산점도
# plot() 함수는 변수가 2개 이상인 데이터에 대해 
# 변수를 2개씩 짝지어 산점도 작성이 가능하다.
# mtcars에서 선택 할 열 이름 지정
vars <- c('mpg', 'disp', 'drat', 'wt')
# mtcars에서 vars 변수에 있는 열들만 target에 대입
target <- mtcars[,vars]
# 상위 데이터만 출력
head(target)
# plot을 이용한 산점도 표시
plot(target, main='Multi plots')
```

### 3. 그룹 정보가 있는 2개 변수의 산점도
- 그룹 정보를 알고 있을 경우 각 그룹별 관측값을 다른 색과 모양으로 표시 가능
``` R
# 그룹 정보가 있는 2개 변수의 산점도
iris.2 <- iris[,3:4] # 변수에 iris에서 가져올 데이터 선택
levels(iris$Species) # 그룹 확인 (해당열이 어떤 큰 종류로 나누어지는지)
# 카테고리 별 동일한 숫자로 그룹핑
group <- as.numeric(iris$Species) 
color<-c('red','green','blue') 
# 카테고리 별 점의 모양과 색을 다르게하여 산점도 표시
plot(iris.2, main='iris plot', pch=c(group), col=color[group])
# 위 산점도에 범례 표시
legend(x='bottomright', legend=levels(iris$Species), pch=c(1:3),
       col=c('red','green','blue') )
```
## Tip. 알면 좋은 그래프
- 막대, 원, 히스토그래프는 중요하다 알고있으면 좋음
- 산점도는 복잡한 계산이 들어간 그래프로 이해하기 어려움

## 데이터 탐색하기
### 1. 탐색적 데이터 분석
- 1단계 : 문제 정의 및 계획
    - 데이터 분석은 해결하려는 문제를 명확히 정의하는 것에서 시작
    - 그래야 문제 해결을 위해 어떤 데이터를 수집하고 분석할 지 계획할 수 있음
- 2단계 : 데이터 수집
    - 문제가 명확히 정의되면 문제를 해결하기 위해 필요한 데이터가 무엇인지 파악하고, 이러한 데이터들을 수집하는 과정을 거침
    - 문제 해결에 필요한 데이터는 다양한 형태로 존재함 ex) 데이터베이스, 엑셀파일, 문서 등
- 3단계 : 데이터 정제 및 전처리
    - 수집 데이터는 바로 분석에 사용할 수 없을 때가 많음 ex) 단위, 결측값, 이상값
    - 수집 데이터를 분석 가능한 형태로 정돈하는 데이터 정제 또는 전처리 과정이 필요
- 4단계 : 데이터 탐색
    - 분석을 위해 정돈된 데이터 자체를 이해하고 파악하는 가벼운 데이터 분석 과정
    - 비교적 간단하고 쉬운 통계 기법을 적용하여 전반적인 데이터의 내용을 파악
    - 탐색적 데이터 분석이라고도 함
- 5단계 : 데이터 분석
    - 데이터 탐색에서 파악한 정보를 바탕으로 보다 심화된 분석 수행
    - ex) 군집분석, 분류 분석, 주 성분 분석, 시계열 분석 등
- 6단계 : 결과 보고
    - 데이터 분석 및 해석을 보고서 형태로 작성
    - 최초 정의했던 문제를 해결하는 데 도움이 되는 내용으로 요약
    - 데이터 시각화 기술이 중요하게 활용됨

### 2. 탐색적 분석의 이해
- 수집 데이터를 이해하기 위한 기본 단계
- 데이터 분석은 수집한 데이터의 종류에 따라 분석에 필요한 도구가 달라짐

### 3. 단일변수 데이터 분석
- 타이타닉호의 승객들이 어떤 선실에 묵었는지 알아보기
- carData 패키지의 TitanicSurvival 데이터셋 사용
    - 탑승객의 성별, 연령대, 탑승 선실, 생존 여부 등을 담은 다중변수 데이터
``` R
# 단일변수 범주형 데이터 분석
install.packages('carData') # TitanicSurvival 데이터 프레임 이용을 위해 패키지 설치
library(carData) # 라이브러리 사용
room.class <- TitanicSurvival$passengerClass # 선실 정보 저장
# 도수 분포 계산 (각 선실의 수를 카테고리 별로 합쳐서 보여줌)
tbl <- table(room.class)
tbl
sum(tbl)
# 막대그래프 작성
barplot(tbl, main='선실별 탑승객', xlab='선실 등급', ylab='탑승객수',
        col=c('blue','green','yellow'))
```

### 4. 단일변수 수치형 데이터 분석












# 장우찬
## 2023.04.27

### 2023-04-27 중간고사 이후 첫 수업, ch08 부터 시작
favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')   # 자료 입력
favorite                            # favorite의 내용 출력
table(favorite)                     # 도수분포 계산


### 막대그래프 표시하기(수직방향), 테이블 생성하기
favorite<-c('winter','summer','spring','summer','summer','fall')
ds <- table(favorite)
ds
barplot(ds,main='Favorite Season')

### 막대그래프에 색상 넣기
barplot(ds,main='Favorite Season', col='blue')

### 색상 이름 검색하는 함수
colors()

### 막대그래프별 색상 표시
barplot(ds,main='Favorite Season', col=c('yellow','blue','red','green'))

# 막대그래프에 색인 넣기(x축과 y축)
barplot(ds,main='Favorite Season', col=c('yellow','blue','red','green'), xlab = '계절', ylab = '빈도수')

### 색상을 임의로 지정하는 함수
barplot(ds,main='Favorite Season', col=rainbow(4), xlab = '계절', ylab = '빈도수')

### 막대그래프 표시하기(수평방향)
barplot(ds,main='Favorite Season', col=rainbow(4), xlab = '계절', ylab = '빈도수',horiz=TRUE)

### 각 막대그래프의 막대 별 이름 넣기
barplot(ds,main='Favorite Season', col=rainbow(4), xlab = '계절', ylab = '빈도수', names=c('가을','봄','여름','겨울'))

### 각 막대별 이름을 수직 방향으로 넣기
barplot(ds,main='Favorite Season', col=rainbow(4), xlab = '계절', ylab = '빈도수', names=c('가을','봄','여름','겨울'), las=2)

### 각 막대별 이름을 수평 방향으로 넣기
barplot(ds,main='Favorite Season', col=rainbow(4), xlab = '계절', ylab = '빈도수', names=c('가을','봄','여름','겨울'), las=1)

### x,y축 전부 바꾸기
barplot(ds,main='Favorite Season', col=rainbow(4), xlab = '계절', ylab = '빈도수', names=c('가을','봄','여름','겨울'), las=3)


### 데이터 입력
age.A <-c(13709,10974,7979,5000,4250)
age.B <-c(17540,29701,36209,33947,24487)
age.C <-c(991,2195,5366,12980,19007)

### 데이터 프레임 결합
ds <-rbind(age.A, age.B, age.C)
colnames(ds)<- c('1970','1990','2010','2030','2050')
ds

### 그래프 작성
### x= topright : 범례 출력 기본위치 
barplot(ds, main='인구추정', 
        col=rainbow(3), 
        beside=T, 
        # legend.text=T,
        legend.text=c('0~14세','15~64세','65세 이상'),
        args.legend = list(x='topright', bty='n', inset=c(-0.25,0)))

### 히스토그램

head(cars)                    
dist <- cars[,2]              # 자동차 제동거리
dist
hist(dist,                    # data
     main='Histogram for 제동거리',   # 제목
     xlab ='제동거리',        # x축 레이블              
     ylab='빈도수',           # y축 레이블                     
     border='blue',           # 막대 테두리색  
     col='green',             # 막대 색
     las=2,                   # x축 글씨 방향(0~3) 
     breaks=5)                # 막대 개수 조절

### 히스토그램은 막대그래프와 유사하나 막대사이 간격 유무의 차이가 있음

result <- hist(dist,                    # data
               main='Histogram for 제동거리',    # 제목
               breaks=5)                # 막대 개수 조절
result
freq <- result$counts                   # 구간별 빈도수 저장
names(freq) <- result$breaks[-1]        # 구간값을 이름으로 지정
freq                                    # 구간별 빈도수 출력


### 다중 그래프

par(mfrow=c(2,2), mar=c(3,3,4,2))     # 화면 분할(2x2)               

hist(iris$Sepal.Length,               # 그래프 1
     main='Sepal.Length',
     col='orange')             

barplot(table(mtcars$cyl),            # 그래프 2
        main='mtcars',
        col=c('red','green','blue'))              

barplot(table(mtcars$gear),           # 그래프 3
        main='mtcars',
        col=rainbow(3),               # 레인보우 팔레트 사용
        horiz=TRUE)              

pie(table(mtcars$cyl),                # 그래프 4
    main='mtcars',
    col=topo.colors(3),           # topo 팔레트 사용
    radius=2)              

par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)  # 화면 분할 취소 


### 원그래프
favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')   # 자료 입력
ds <- table(favorite)                                         # 도수분포 계산
ds                
pie(ds, main='선호 계절',                                     # 원그래프 작성
    radius=1)                                   
pie(ds, main='선호 계절',
    col=c('brown','green','red','black'),    # 파이의 색 지정
    radius=1 )                               # 파이의 크기 지정 

install.packages('plotrix')

### 3차원 원그래프 
library(plotrix)
pie3D(ds, main='선호 계절',
      labels=names(ds),                              # 파이별 레이블 지정
      labelcex=1.0,                                  # 레이블의 폰트 크기
      explode=0.1,                                   # 파이 간 간격
      radius=1.5,                                    # 파이의 크기 
      col=c('brown','green','red','yellow'))         # 파이의 색 지정


### 원그래프

month = 1:12                             # 자료 입력
late  = c(5,8,7,9,4,6,12,13,8,6,6,4)     # 자료 입력      
plot(month,                              # x data
     late,                               # y data
     main='지각생 통계',                 # 제목 
     type='l',                           # 그래프의 종류 선택(알파벳) 
     lty=1,                              # 선의 종류(line type) 선택
     lwd=1,                              # 선의 굵기 선택
     xlab='Month',                       # x축 레이블
     ylab='Late cnt'                     # y축 레이블
)


## 2023.04.13

### txt 파일 읽기
data <- read.table("airquality.txt", header = TRUE, sep = "\t")

data

### 조건문
job.type <- 'A'
if(job.type=='B'){
  bobus <- 200
} else{
    bonus <- 100
}
print(bonus)

### if-else 문
### ifelse(test, yes, no)
### test: 조건을 나타내는 논리식
### yes: 조건이 참(True)인 경우 반환할 값 또는 연산식
### no: 조건이 거짓(False)인 경우 반환할 값 또는 연산식

x <- c(3, 0, -2, 5, -1, 0)
result <- ifelse(x > 0, "양수", ifelse(x == 0, "0", "음수"))
result 

### for 문
for (i in 1:5)
  print ('*')

### print -> 주로 객체 출력, cat -> 문자열 출력시 사용

### while 문

sum <- 0
i <- 1
while(i<=100){
  sum <- sum+1;
  i <- i+1;
}
print(sum)

### apply 함수
### 매트릭스나 데이터프레임의 데이터를 차례로 꺼내어 평균이나 합계등을 구하는 작업을 수행할때 사용

iris
### 두번째 값 = 1 / 2 = 행/열 방향으로 함수 적용
apply(iris[,1:4], 1, mean)


### 사용자 함수 선언 및 매개변수에 기본값 설정
mymax <- function(x,y=2){
  num.max <- x
  if(y>x){
    num.max <- y
  }
  return(num.max)
}
mymax(10)
mymax(10,15)


### 정의한 사용자 함수 파일 불러오기
source('mymax.R')
mymax(1)

### which 함수 = 조건에 맞는 데이터 위치 찾기
score <-c(76,84,69,50,95,60,82,71,88,84)
which(score==69)
max(score)
min(score)
which.max(score)

idx<- which(score==60)
score[idx] <- 61
score

which(score>=80)
idx<-which(score>=80)
score.high<- score[idx]
score.high

### 사용자 정의 함수
* 사용자가 스스로 만드는 함수
* 함수명 <- function(매개변수 목록){
    실행할 명령문
    return(함수 실행 결과)
}
* 사용자 함수 정의후 파일 저장 및 source(파일명.R) 로 함수 불러오기 가능

### 2023.04.06

### 데이터 프레임
* 열과 행으로 구성된 2차원의 데이터 구조


### 4개의 행을 생성, 그안에 값 넣기
z<- matrix(c(90,87,76,98,88,94,500,27,96,74,75,76), nrow=4)

### 행과 열에 이름 붙여주기
rownames(z)<- c('john', 'tom','mark', 'jane')
colnames(z)<- c('국어','영어','수학')

z

### 표로 보기
View(z)

z['jane', '수학']
z['mark',]


### 데이터 프레임 만들기
city<-c('seoul', 'toyko', 'washington')
rank<-c(1,2,3)
city.info <- data.frame(city,rank)
city.info

iris
#1~2열의 모든 데이터
iris[,c(1:2)]
#1~5행 데이터중 1,3열의 데이터
iris[1:5,c(1,3)]
#행 개수
nrow(iris)
#행과 열 개수
dim(iris)
### 열이름 보이기 names 함수와 동일
colnames(iris)
### 데이터 셋의 앞부분 일부 보기
head(iris)
### 데이터셋의 뒷부분 일부 보기
tail(iris)

#합계와 평균 구하기
#열 별 합계
### -는 5번쨰 컬럼을 빼라
colSums(iris[,-5])
colSums(iris[,-5])

#열별 평균
colMeans(iris[,-5])
#행별 합계
rowSums(iris[,-5])
#행별 평균
rowMeans(iris[,-5])

### 매트릭스와 데이터프레임에 함수 적용
z<- matrix(1:20, nrow=4, ncol=5)
z
### 행 열 방향 전환
t(z)

#조건에 맞는 행과 열 값 추출하기

IR.1 <- subset(iris, Species='setosa')
IR.1

IR.1[,c(2,4)]

### 산술연산 적용

a<- matrix(1:20,4,5)
b<- matrix(21:40,4,5)
a
b

2*a

a+b

a<- a*3
b<-b-5
b

### 매트릭스와 데이터프레임 자료구조 확인하기
### iris 데이터셋 자료구조 확인
class(iris)
### 메트릭스 데이터셋 선언 
state.x77
### state.x77 데이터 셋의 자료구조 확인
class(state.x77)
### 데이터셋이 맥트릭스인지 데이터프레임인지 확인
is.data.frame(iris)
is.matrix(iris)
is.data.frame(state.x77)

### 매트릭스와 데이터프레임의 자료구조 변환하기

is.matrix(state.x77)
st <- data.frame(state.x77)
head(st)
is.matrix(st)

is.data.frame(iris[,1:4])
iris.m <- as.matrix(iris[,1:4])
head(iris.m)
class(iris.m)

### 열 추출 방법 -> 다양한 방법이 있음
iris[,"Species"]
iris[,5]
iris["Species"]
iris[5]
iris$Species


#화면에서 데이터 입력받기
install.packages('svDialogs')
library(svDialogs)
user.input <- dlgInput('input income')$res
user.input
income <- as.numeric(user.input)
income
tax<- income*0.05
cat('세금', tax)


#데이터의 출력

### print > 2차원 은 불가능 cat은 가능

#현재 작업폴더
getwd()

#작업폴더 변경
setwd('D:/Woochan')
setwd('D:/Woochan/23-Project1-R/23-Project1-R')

getwd()

#csv 파일 읽기 및 쓰기
### working directory 에 파일이 있어야함
air <- read.csv('airquality.csv', header=T)

head(air)



### csv 파일 생성
my.iris <- subset(iris, Species =='setosa')

my.iris

head(my.iris)

write.csv(my.iris, 'my_iris.csv', row.names=F)
write.csv(my.iris, 'my_iris2.csv')

### 엑셀 파일 읽기 쓰기
install.packages('xlsx')
library(xlsx)



## 2023.03.30 수업

## 자료
### 자료 분석의 목적
* 자료에 담겨있는 어떤 종류의 정보나 지식을 추출하고 이를 통해 현실을 이해하거나 현실의 문제를 해결하는데 활용하기 위함

### 1차원 자료와 2차원 자료
* 1차원 자료 > 단일 주제에 대한 값
  * ex) 시도별 인구수
* 2차원 자료 > 복수주제 > 표(테이블)의 형태로 표현됨
  * ex) 4학년 학생의 전과목 성적

### 범주형 자료와 수치형 자료
* 범주형 자료 : 분류의 의미를 갖는 값들로 구성된 자료
  * ex) 찬성여부 : YES,no,YES
  
* 수치형 자료 : 보톤문자로 표현되고 산술 연산 적용 불가능
  * ex) 키 : 169, 173

* 배열중 1차원은 배열에서 list와 2차원 배열의 data Frame은 여러 자료형을 섞어서 배열 정의가 가능
  * 단, 숫자 벡터와 문자벡터를 결합하면 숫자값이 문자로 변환되어 결합됨
  * 동일한 종류의 값들만 저장 가능함

### 팩터
* 문자형 데이터가 저장되는 벡터의 일종으로, 저장되는 문자값들이 어떠한 종류를 나타내는 값일때 사용

### 리스트
* 자료형이 다른 값들을 한곳에 저장하고 다룰수 있도록 해주는 수단
* ex) 이름: 장우찬 나이:31 학생 : TRUE 취미 : GAME

## 메트릭스

### 매트릭스와 데이터프레임
* 매트릭스와 데이터프레임은 2차원 자료를 저장하기위한 대표적인 자료구조
  * 1차원 자료 : 학생들의 몸무게 같이 단일주제 값들 모아놓은것
  * 2차원 자료 : 키,몸무게, 나이와 같이 한사람에대한 여러 주제로 데이터를 수집한 형태
* 메트릭스와 데이터 프레임의 차이점은 매트릭스에 저장되는 모든 자료의 종류가 동일한 반면 매트릭스는 자료형이 다를수 있음

### 2차원 자료
* 가로줄(row)은 행,관측값
* 세로는(collum) 열,컬럼, 변수




## 2023.03.23 수업
## 패키지 설치
* 패키지 설치하기
  * R 스튜디오에서 패키지를 설치하기전에 인터넷 연결되어있는지 확인 필요
* 명령어로 설치하기
  * R에서 install.packages() 함수를 이용하면 알아서 설치
  * install.packages("ggplot2")
* GUI 설치
  * R 스튜디오에서 파일 영역의 packages 탭에서 install 클릭
  * "cowsay" 검색 및 설치
  * 이후 검색창에 입력하면 정상적으로 설치된 패키지가 있는지 확인 가능

* 패키지 사용 명령어
  * library(ggplot2) -> 라이브러리를 사용하겠다는 선언

* 도움말
  * 소스 창에서 함수앞에 ?sort

## Chapter 3. 변수, 벡터, 함수 알아보기

### 변수의 개념
* 상수 : 한번 선언하면 변하지 않는 고정된 값
* 변수 : 선언 후 지속적으로 값을 변경할 수 있음
* 한개의 변수에는 하나의 값만 저장 가능

### 변수 작명 규칙
* 일반적으로 영문자로 시작
* 타인에게 보이기 싫은 파일은 앞에 마침표(.) 을 붙여 보이지 않는 파일로 만듬
* 두번째 글자부터 영문자, 숫자, 마침표, 밑줄 가능. 특수문자 사용 불가
* 변수명에서 대소문자는 별개 문자 취급
* 변수면 중간에 빈칸 사용 불가


### 변수에 저장될 수 있는 값으 종류
* 숫자
* 문자
* 논리형 (TRUE=1, FALSE=0)
  * T,F 가능
* 특수값 (NULL, NA, NAN, Inf, -Inf)
  * NULL : 정의되지 않음
  * NA : 결과 예측값
  * NaN : 수학적으로 적의 불가능한 값
  * Inf, -Inf : 양의 무한대, 음의 무한대

### 벡터의 개념

* 동일한 자료형의 값들이 하나로 묶여 있는 자료구조
  * EX. 열명의 학생 성적을 변수에 저장한 후 평균을 계산하는 경우
* c() 함수를 통해 선언 가능
* 배열과 비슷함
* 하나의 벡터에는 동일한 자료형의 변수를 선언해야 함

### 벡터 만들기
* R 파일 참조
* 벡터는 배열과 다르게 인덱스가 1부터 시작

# 함수의 Parameter (매개변수) 와 argument(인자) 차이
* parameter : 함수 정의할 때 사용하는 변수
* argument : 함수를 호출할 때 실제로 전달되는 값

## Chapter 4. 자료분석

### 자료 분석의 목적
* 자료분석을 하는 이유는 자료에 담겨있는 어떤 종류


## 개인 공부 정리 
## GIT 명령어

* git add . -> 현재 경로에 stg
* git commit -m "message"-> 커밋
* git branch -> 전체 브랜치 확인
* git branch [aa] -> aa 브랜치 생성
* git checkout aa -> aa 브랜치로 스위칭
* git status -> git 상태 확인 어떤 브랜치인지 알려줌
* git merge [aa] -> 현재 브랜치에 aa브랜치 합치기
* git push -> 원격 레파지토리에 push



## 2023.03.16 수업

## md 파일 작성 요령 (파일 이름은 대문자)
1. 이름 : h1 맨위에 적기
2. 강의 날짜 : h2
3. 학습 내용 (필수) : h2 이하 사이즈 자유롭게 사용
4. 작성 코드(선택)
5. 최근 내용이 위에 오도록 작성
6. 날짜별 구분이 잘가도록 작성
7. 매 수업마다 git 사용자 인증정보 확인 필요

## 1. R 언어의 특징

* 데이터 분석에 특화된 언어
  * R은 통계를 포함한 데이터 분석 작업에 활용할 목적으로 개발된 언어
  * R은 컴파일 과정 없이도 바로 실행하여 결과 확인 가능
  *  R로 작성한 것을 프로그램이 아니라 스크립트라고 부름
* 다양한 패키지 제공
  * R은 데이터 분석에 사용되는 함수을을 종류별로 묶어 패키지 형태로 제공
  * 데이터 분석에 필요한 거의 모든 기능이 제공됨
  * 최신 이론이 발표되면 바로 R 패키지가 만들어지기 때문에 신속하게 최신이론을 데이터 분석에 활용이 가능함
* 미적이고 기능적인 통계 그래프 제공
  * 데이터 분석에 있어서 분석 결과를 시각적으로 표현하는 것은 매우 중요함
  * R 에서는 ggplot 라는 패키지를 통해 아름다우면서도 기능적인 그래프를 쉽게 장성할 수 있도록 지원
* 편리한 프로그래밍 환경
  * R프로그래밍을 위한 통합 개발 환경으로 R 스튜디오가 제공되어 모든 작업을 R 스튜디오 내에서 처리할 수 있음
  * 프로그램 작성,실행,수정 등 여러 작업을 수행하려면 보다 편리한 작업 환경이 필요함
  * 이러한 작업 환경을 통합 개발 환경, IDE(Intergrated Development Environment)라고 함
  * VS CODE 로 코딩후 R 에서 실행
  * 
* 무료 사용
  * R은 무료로 사용할 수 있는 오픈소스 소프트웨어
  * 1년에 1~2차례 정기적 업데이트
  * MAC Windows 등 다양한 운영체제에서 지원
  * 앱이나 변수의 실시간 확인을 위하여 R 스튜디오는 필수적으로 써야함
  * VS코드는 가독성과 관리 때문에 함께 사용
# Chapter 2. R 을 배우는 이유

* 4차 산업혁명
인공지능, 빅데이터, 로봇, 사물인터넷등 새로운 과학기술이 정치,경제,문화 전반에 영향을 미치면서 이러한 변화를 수용하고 발전 가능성을 최대화 시키는 시대로, 인공지능과 빅데이터가 핵심기술로 인식됨
* 4차산업 혁명의 중심은 '데이터'
* 시대적 흐름은 데이터를 잘 다룰줄아는 기업과 개인이 경쟁에서 우위를 점할수 있음을 의미
* 컴퓨팅 사고와 데이터 활용 능력은 전공을 불문하고 어떤분야로 진출하든 점점 더 중요한 스펙임

* R은 배우기 쉬우면서도 강력한 데이터 처리 및 데이터 분석 능력을 제공함
* 프로그래밍 언어로 컴퓨팅 사고를 배우기도 적합

##  Chocolatey 설치

1. chocolatey 검색
2. power shell 등 관리자 권한 실행후 커맨드 창에 설치 명령어 입력
3. 이후 사이트에서 Find package 를 통해 검색된 패키지들을 choco 명령어로 설치 가능

## R & R 스튜디오 설치
1. R
* https://cran.yu.ac.kr/bin/windows/base/R-4.2.2-win.exe 를 통해 설치
2. R Studio
* https://posit.co/download/rstudio-desktop/ 에서 IDE 설치 


## R 스튜디오 화면구성
* 소스, 콘솔 환경, 파일 영역으로 구성되어 4등분 되어있음
* 소스 영역은 File- New File - R script 선택하여 생성
* git 설치되어있는 경우 콘솔 영역에 terminal 에서 bash shell 이 보여짐

* 소스 영역
  * 소스창 : R명령문 작성 및 실행 영역, 메모장 개념
  * Run 버튼 : 실행 버튼 눌러야 명령문 실행됨 
  * = 와 <- 가 같음 (변수에 데이터 저장시)
* 콘솔 영역
  * 콘솔창 : 소스창에서 작성한 R 명령문을 실행 해을때 과정및 결과 표시 영역
* 환경 영역
  * 환경창 : R명령문이 실행되는 동안 만들어지는 각종 변수나 자료구조 내용을 보여주는 영역  
  * 히스토리창 : 작업 과정에 대한 이력 보여주는 창
  * 커넥션창 : 데이터관리를 위한 서버 연결하는 창
  * 튜토리얼창 : R 배울수 있는 창
* 파일 영역
  * 파일창 : 파일 탐색기와 같은 역할, 작업 폴더 지정 가능
  * 작업 폴더 설정 : 파일창에서 more 버튼 > set as working directory 클릭
  * 플롯창 : 그래프 표시
  * 패키지창 : 함수 들에 대한 패키지 형태로 제공
  * 뷰어창 : 분석의 결과가 숫자가아닌 이미지 형태일때 웹브라우저 상에 결과를 출력하는 경우가 있는데 그런경우 뷰어창으로 표시

* 단축키
  * 한줄 명령문 실행 : 커서줄 특정 위치시킨 후 Ctrl + Enter
  * 여러줄 명령문 실행 : 여러줄 드래그 후 Ctrl + Enter

* 불완전한 명령문
  * 괄호 빠뜨리고 엔터시 아직 끝나지 않았다고 판단하여 이어쓰게 됨
  * 대소문자 변수 구분

* 한줄에 여러개 명령문 작성
  * 세미콜론(;)를 통해 여러 명령문 작성 가능

* 산술 연산자
  * 컴파일을 통해 exe 형태의 실행파일을 만들지 않고, 바로 명령문을 실행하는 인터프리터 방식, 스크립트언어
  * %%는 나눈 나머지
* 주석
  * '# 2^3'
  
## 3. 패키지의 개념
* 패키지 : 함수들을 기능별로 묶어놓은 일종의 꾸러미.
* 스스로 공구를 만들어 사용할 수 있지만, 다른사람이 이미 잘 만들어놓은 도구가 있다면 가져다 쓰는곳이 효율적


## 우찬 주말에 할일 2023.03.16
* fatal: refusing to merge unrelated histories 오류 해결 찾기
* 원격 레파지토리의 데이터를 로컬 저장소로 pull 해주어야 함







## 2023.03.02

* R Language - Data Science Language

* 책 - 난생처음 R언어 & 데이터 분석

* React - Java script 의 Library



## 학점 관련

1. 출석 20% 
* 별도의 사유가 있는 경우, 수업 전날까지 연락하여 관련 문서 제출
* 지각한 경우, 어느정도 지나도 수업 이후 이야기해주면 출결 처리
2. 수행 20%
* 별도의 수행평가는 진행하지 않으나, 배운 것을 정리해서 Github 에 README.md 파일을 업로드하여 평가
3. 중간고사 30%
* 실기 시험 작업 지시서 (15 ~ 20가지)
* 어떠한 데이터를 어떠한 방식으로, 어떠한 함수를 써서 어떠한 차트로 표현 하라는 요구에 대한 평가로 진행.
*  메신저 제외 모든 방법 이용 가능
4. 기말고사 30%
* 실기, 작업 지시서 (15 ~ 20가지) 
* 어떠한 데이터를 어떠한 방식으로, 어떠한 함수를 써서 어떠한 차트로 표현 하라는 요구에 대한 평가로 진행.
* 메신저 제외 모든 방법 이용 가능



# Git
*  분산 버전 관리 시스템
* 특정 소프트웨어의 History 확인 가능
* 대형 프로젝트에서도 유용함 (속도나 크기면에서)
* 비선형적인 개발 (수천 개의 동시 다발적인 브랜치)


# Semantic Versioning 
* S/W 개발 과정에서 수정 사항 발생할 때 마다 숫자나 문자 등을 이용하여 표시함으로써 수정 이력 확인하기 위한 방법
* 개발 과정 추적 및 효율적인 개발 가능
* 버전 관리란 이러한 버전을 효율적으로 사용하기 위한 방법
* 유의적 버전 구글링하면 참조가능

* ver. X.      Y.       Z
* X=배포  Y=기능   Z=오류







# 장우찬


# h1 tag
## h2 tag
### h3 tag


1. asdsadada

* asdasdsadasd


<div>dsafdsf</div>
 

# 1. Git 설치 및 설정

1. GIT 사이트 접속
2. Standalone Installer
3. 64-bit Git for Windows Setup. 설치

4. git 버전 확인 명령어
* git –- version
* git -v (명령어에 ‘-’ 이 두개인 경우 풀네임을 써야함)

5. github 회원가입 및 VS CODE 설치

6. Git 사용자 설정
* git config --global user.name "woochan"
* git config user.email “lusitan@naver.com”
  -> 시스템 전체에서 사용

7. Local 사용 사용자 정보 설정
* global 설정과는 다르게 특정 폴더만 계정 설정하고 사용 가능
* 공용 PC 에서 비교적 안전하게 사용가능
* –global 옵션만 지워주면됨

# 2. VS CODE 에서 설정

1. VS CODE 에서 23-React1 (23-Project1-R) 폴더 생성

2. Source Controll 에서 Initialize Repository

3. 초기화 된 폴더에서 파일이 생성되거나 파일 내용 변경시 GIT 이 추적 시작

4. 파일 stage에 올린 이후, Commit Message 작성  
* Git에 올라가는 Readme 파일은 대체적으로 대문자
* Commit Message 제목 -> 50byte
* 내용 길이는 상관 없다.
5. 일부 파일 Commit
* 변경 내용중 일부만 commit 후 push하는 경우, 케밥 메뉴 클릭하고 push 선택

6. Remote 에 Repository 생성
* Github에 아직 Repository가 없는 경우 안내창 발생
* Add Remote 버튼 클릭 후 원하는 Repository 선택
* Public 및 private 선택

# GIT HUB 와 연동

1. VSCode의 status bar왼쪽의 구름 아이콘을 클릭

2. GitHub로 push 이후 HOST PC 연동

3. GitHub 로그인 -> Allow

4. 브라우저에서 로그인 및 설정

5. VS CODE 에서 URL OPEN



# 프로그래밍이란

### 컴퓨터의 구성 : 하드웨어와 소프트웨어

* 하드웨어 : 형태를 가진 기계장치
* 소프트웨어 : 하드웨어 기능을 원할하게 수해하기 위한 명령들의 집합

### 프로그래밍과 프로그래밍 언어
* 프로그래밍 : 레시피처럼 순서와 방법을 논리적으로 제시하는 과정
* 프로그래밍 언어 

  * 근래에는 java script 를 많이 이용하는 추세
  * python > 다양한 범주에 많이 사용됨
  * R > 데이터 분석에만 특화되어 있음

### 단순 명령어 세트 / 복잡 명령어 세트 (CISC와 RISC)


# R 언어

* 비교적 최근에 개발된 언어
* S-PLUS의 무료 버전

## R언어의 특징




