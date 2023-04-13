
# ggplot2 라이브러리 선언
library(ggplot2)

# mpg 데이터셋 불러오기
data(mpg)

# 자동차 연비와 관련된 그래프 그리기
ggplot(mpg, aes(x = class, y = hwy)) + geom_boxplot() +
labs(title = "자동차 연비 그래프", x = "자동차 종류", y = "고속도로 연비")

# cowsay 라이브러리 써보기
library(cowsay)
say("HELLO WORLD", by="cat")
say("HELLO WORLD", by="snow")

# 현재시간 불러오기
Sys.time() 


total <- 5050
total
print("total")
cat("합계 :", total)


# 벡터 선언
foo <- c(1,2,3,4,5,6,7)

# 평균값 
mean(foo)

# 1부터 100까지의 벡터 선언
v1 <- 1:100

# 일정한 간격의 숫자로 이루어진 벡터 선언
v3 <- seq(1,101,3)

#반복된 숫자로 이루어진 벡터
v5 <- rep(1:5, times=5) # 1,2,3,4,5 3번 반복
v6 <- rep(c(1,5,9), times=5)
v7 <- rep(1:5, each=5) # each 옵션을 주면 각각 5회 반복


# names 함수 : 각 객체에 이름 부여
absent <- c(1,2,3,4,5)
# 요일 이름을 붙임
names(absent) <- c('Mon','TUe', 'Wed', 'Thu', 'Fri')
absent

# 벡터는 배열과 다르게 인덱스가 1부터 시작됨
absent[1]

# 2번째 인덱스 값 호출
absent[2]
# name 값으로 출력을 할 수 있다.
absent["Thu"]


absent[1] <- 100
# 1,2번째 인덱스에 100, 200 넣기
absent[c(1,2)] <- c(100,200) 
absent


d <- c(1,4,3,6,8)
d[c(1,3,5)]
d[1:3]
d[-2] # 인덱스 2값 제외하고
d[-c(3:5)] # 세번째에서 5번째값은 제외

# paste 함수 : 문자열과 문자열을 결합하고 sep 으로 구분하여 출력
# sep 공백도 가능
str <- paste('good', 'mornig', 'every one', sep='/')
str

# 1에서부터 12지의 숫자에 월 붙여서 출력하기
a<- 1:12
b<- '월'
c<- paste(a,b, sep ='')
c<- paste(1:12, '월', sep='')
c


d<- c(1,4,3,7,8)
2*d
d-5
3*d+4



# 인덱스의 위치가 같은 것 끼리 연산
x<-c(1,2,3,4)
y<-c(5,6,7,8)

x+y

# 숫자 벡터와 문자 벡터 결합
y<-c(5,6,7)
y<-c("a","b","c","d")
x+y

m<- c(x,y)
m<- c(y,x)
m


#숫자 벡터와 문자벡터를 결합하면 숫자값이 문자로 변환되어 결합됨
#동일한 종류의 값들만 저장 가능함
m<- c(x,y,100,"apple")
m

y<-c(5,6,7,8)
m<- c(x,y)
m

#다양한 연산자
sum(x)
mean(x)

#오름/내림차순 정렬
sort(x, decreasing = T)

# 비교 연산자
d<- 1:9
d >= 5
d[d>5]

# 벡터에 논리연산자 적용되면 벡터의 개수가 들어감
# 5보다 큰 값의 개수를 출력
sum(d>5)
length(d)
length(d>5)


TRUE == 1

#에스프레소 2000원
x<-c(4,5,3)
#아메리카노 2500원
y<-c(63,68,70)
#카페라떼 3000원
z<-c(61,70,75)


s.x <-x*2.0
s.y <-y*2.5
s.z <-z*3
s.day <- s.x + s.y + s.z
s.day

names(s.day) <-c("Mon","Tue","Wed")

s.day

# 전체 매출 합
sum(s.day)

#팩터
bt<- c('A','B','B','O','AB')
bt.new <- factor(bt)

# 팩터는 어떠한 종류들이 있는지 보여준다.
bt
bt.new

bt[3]
bt.new[5]

#문자를 숫자로 표현 (bt.new 에서의 순서 기준)
# A= 1 AB=2 B=3 O=4
as.integer(bt.new)
bt.new


h.list <-c("balling","tennis","ski")
person <- list(name="장우찬", age=31, student=TRUE, hobby=h.list)
person

# 매트릭스 만들기 로우는 행 개수, 컬럼은 열(변수) 개수
z <- matrix(1:20, nrow=4, ncol=5, byrow = T)
z



# c바인드 r바인드 
x<-1:4
y<-5:8

xy<- cbind(x,y)

xy2 <- rbind(x,y)
xy2

xy3 <- rbind(xy2, x)
xy3

xy4 <- cbind(z,x)
xy4


# 2행의 값중에 1~3열 데이터 읽어주기 

z<- matrix(1:20, nrow=4, ncol=5, byrow = T)
z[2,1:3]
z[1,c(1,2,4)]
z[3,c(1,2,5)]
z[1:2,]

# 4개의 행을 생성, 그안에 값 넣기
z<- matrix(c(90,87,76,98,88,94,500,27,96,74,75,76), nrow=4)

# 행과 열에 이름 붙여주기
rownames(z)<- c('john', 'tom','mark', 'jane')
colnames(z)<- c('국어','영어','수학')

z

# 표로 보기
View(z)

z['jane', '수학']
z['mark',]


# 데이터 프레임 만들기
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
# 열이름 보이기 names 함수와 동일
colnames(iris)
# 데이터 셋의 앞부분 일부 보기
head(iris)
# 데이터셋의 뒷부분 일부 보기
tail(iris)

#합계와 평균 구하기
#열 별 합계
# -는 5번쨰 컬럼을 빼라
colSums(iris[,-5])
colSums(iris[,-5])

#열별 평균
colMeans(iris[,-5])
#행별 합계
rowSums(iris[,-5])
#행별 평균
rowMeans(iris[,-5])

# 매트릭스와 데이터프레임에 함수 적용
z<- matrix(1:20, nrow=4, ncol=5)
z
# 행 열 방향 전환
t(z)

#조건에 맞는 행과 열 값 추출하기

IR.1 <- subset(iris, Species='setosa')
IR.1

IR.1[,c(2,4)]

# 산술연산 적용

a<- matrix(1:20,4,5)
b<- matrix(21:40,4,5)
a
b

2*a

a+b

a<- a*3
b<-b-5
b

# 매트릭스와 데이터프레임 자료구조 확인하기
# iris 데이터셋 자료구조 확인
class(iris)
# 메트릭스 데이터셋 선언 
state.x77
# state.x77 데이터 셋의 자료구조 확인
class(state.x77)
# 데이터셋이 맥트릭스인지 데이터프레임인지 확인
is.data.frame(iris)
is.matrix(iris)
is.data.frame(state.x77)

# 매트릭스와 데이터프레임의 자료구조 변환하기

is.matrix(state.x77)
st <- data.frame(state.x77)
head(st)
is.matrix(st)

is.data.frame(iris[,1:4])
iris.m <- as.matrix(iris[,1:4])
head(iris.m)
class(iris.m)

# 열 추출 방법 -> 다양한 방법이 있음
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

# print > 2차원 은 불가능 cat은 가능

#현재 작업폴더
getwd()

#작업폴더 변경
setwd('D:/Woochan')
setwd('D:/Woochan/23-Project1-R/23-Project1-R')

getwd()

#csv 파일 읽기 및 쓰기
# working directory 에 파일이 있어야함
air <- read.csv('airquality.csv', header=T)

head(air)



# csv 파일 생성
my.iris <- subset(iris, Species =='setosa')

my.iris

head(my.iris)

write.csv(my.iris, 'my_iris.csv', row.names=F)
write.csv(my.iris, 'my_iris2.csv')

# 엑셀 파일 읽기 쓰기
install.packages('xlsx')
library(xlsx)



### 2023.04.13

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

# for 문
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

## apply 함수
## 매트릭스나 데이터프레임의 데이터를 차례로 꺼내어 평균이나 합계등을 구하는 작업을 수행할때 사용

iris
## 두번째 값 = 1 / 2 = 행/열 방향으로 함수 적용
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

