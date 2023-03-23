
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
