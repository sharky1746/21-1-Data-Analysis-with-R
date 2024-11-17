library(datasets)

str(iris)

subset(iris, Species == "setosa")[1:5,]
subset(iris, Species == "versicolor")[1:5,]
subset(iris, Species == "virginica")[1:5,]
subset(iris, Petal.Length < 2)[,"Species"] 
summary(iris) 
iris
par()
#Q1
par(mar=c(7,3,1,1))
boxplot(iris,las = 2) 

#Q2
par(mfrow=c(1,3))
irisVer <- subset(iris, Species == 'versicolor') 
irisSet <- subset(iris, Species == 'setosa')
irisVir <- subset(iris, Species == 'virginica')
boxplot(irisVer[,1:4], main = "versicolor",las = 2,ylim=c(0,8)) 
boxplot(irisSet[,1:4], main = "setosa",las = 2,ylim=c(0,8)) 
boxplot(irisVir[,1:4], main = "virginica",las = 2,ylim=c(0,8)) 

#Q2'
hist(iris$Petal.Length)
par(mfrow=c(1,3))
hist(irisVer$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))
hist(irisSet$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))
hist(irisVir$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))

#Q3
install.packages("beanplot")
library(beanplot)
iris_flowers <- subset(iris, select=-c(Species))
beanplot(iris_flowers, main = "iris flowers",las = 0,
         col=list(c('#ff8080','#7781ff','#7781ff',color="#ff5bff")),ylim=c(0,8)) 

#Q4
corr <- cor(iris[,1:4])
round(corr,3)
pairs(iris[,1:4],col=iris[,5],oma=c(3,3,3,13))
par(xpd=TRUE)
legend(0.8,0.6, as.vector(unique(iris$Species)),fill=c(1,2,3))

#Q5
install.packages("MASS")
library(MASS)
parcoord(iris[,1:4], col=iris[,5],var.label=1,oma=c(3,3,3,13))
par(xpd=TRUE)
legend(0.8,0.6, as.vector(unique(iris$Species)),fill=c(1,2,3))



