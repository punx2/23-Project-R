
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
z
z[2,1:3]
z[1,c(1,2,4)]
z[3,c(1,2,5)]
z[1:2,]
