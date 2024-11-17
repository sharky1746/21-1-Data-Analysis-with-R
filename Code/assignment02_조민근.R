# GEK-6185 Assignment02

# Q1. Fibinacci 수열을 반환하는 함수를 recursion을 사용해 코딩하십시오.
# 	음수가 입력되면 부적절한 함수 인자 입력을 사용자에게 알리는 아래 메세지를 return하고 종료합니다.
# 	"Fibonacci 수열 함수 인자는 0과 같거나 0보다 커야합니다."
# 	예를 들어, 함수명을 fibo로 정하고, 자신의 코드을 테스트하기 위해 함수 fibo(10)을 call 했다면
# 	아래와 같은 결과를 화면에 출력하여야 합니다.
f(0) = 0
f(1) = 1
f(2) = 1
f(3) = 2
f(4) = 3
f(5) = 5
f(6) = 8
...
f(10) = 55

fibo.sub = function(x) {
    if(x==0) return(0) else
    if(x==1) return(1) else
  {return(fibo.sub(x-2) + fibo.sub(x-1))}
}

fibo = function(x){
  if(x<0){
    print('Fibonacci 수열 함수 인자는 0과 같거나 0보다 커야합니다.')
  } else
  for (i in 0:x)       
    print(paste("fibo(",i,") = " ,fibo.sub(i)))
}

for (i in -3:5){
  fibo(i)
}


# Q2. Fibinacci 수열을 반환하는 함수를 recursion을 사용하지 않고 코딩하십시오. 모든 조건은 Q1과 동일합니다.


fibo.sub2 = function(x) {
  
  if(x==0) return(0) else
  if(x==1) return(1) else{
      a<-0
    b<-1
    for(i in 0:(x-2)){
      c<-a+b
      a<-b
      b<-c
    }
    return(c) 
  }
}


fibo = function(x){
  if(x<0){
    print('Fibonacci 수열 함수 인자는 0과 같거나 0보다 커야합니다.')
  } else
    for (i in 0:x)       
      print(paste("fibo(",i,") = " ,fibo.sub2(i)))
}

for (i in -3:5){
  fibo(i)
}

