# GEK-6185 assignment02
# Q1. Fibinacci 수열을 반환하는 함수를 recursion을 사용해 코딩하십시오.
# 	음수가 입력되면 부적절한 함수 인자 입력을 사용자에게 알리는 아래 메세지를 return하고 종료합니다.
# 	"Fibonacci 수열 함수 인자는 0과 같거나 0보다 커야합니다."
# 	예를 들어, 함수명을 fibo로 정하고, 자신의 코드을 테스트하기 위해 함수 fibo(10)을 call 했다면
# 	아래와 같은 결과를 화면에 출력하여야 합니다.

# f(0) = 0
# f(1) = 1
# f(2) = 1
# f(3) = 2
# f(4) = 3
# f(5) = 5
# f(6) = 8
# ...
# f(10) = 55

fibo <- function(n){
  if(n < 0) {
    return("Fibonacci 수열 함수 인자는 0과 같거나 0보다 커야합니다.")
  } else {
      recur_fibo <- function(m) {
        if(m <= 1) {
	      return(m)
	    }
        else {
	      return(recur_fibo(m-1)+recur_fibo(m-2))}
        }
      for(i in 0:n) {cat("f(",i,") = ",recur_fibo(i),"\n")}
    }
}

# Test for Q1 Validation
fibo(-3)
fibo(2)
fibo(10)
fibo(30)

# Q2. Fibinacci 수열을 반환하는 함수를 recursion을 사용하지 않고 코딩하십시오. 모든 조건은 Q1과 동일합니다.

fibo <- function(n){
  if(n < 0){
    return("Fibonacci 수열 함수 인자는 0과 같거나 0보다 커야합니다.")
  }
  fibo_0 <- 0
  fibo_1 <- 1
  for(i in 0:n){
    if (i == 0){
      print(paste0("f(",i,")=", fibo_0))
      fibo_prev <- fibo_0
    } else if (i == 1){
      print(paste0("f(",i,")=", fibo_1))
      fibo_current <- fibo_1
    } else {
      fibo_next <- fibo_prev + fibo_current
      print(paste0("f(",i,")=", fibo_next))
      fibo_prev <- fibo_current
      fibo_current <- fibo_next
    } 
  }
}

# Test for Q2 Validation
fibo(-3)
fibo(2)
fibo(10)
fibo(30)