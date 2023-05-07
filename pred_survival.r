library(randomForestSRC)
sur<-readRDS("survival.rds")
input<-read.csv("input_survival.csv")
pred_sur <- predict(sur, newdata = input,na.action="na.impute")

for(i in 1:nrow(input)){
jpeg(paste0("pred_survival_",i,".jpg"),width=600,height=600,quality=100)
plot(sur$time.interest,100*sur$survival[i,],ylim=c(0,100),xlab="Time after surgery (month)",ylab="Survival probability (%)",main="",lty=1,type="l")
dev.off()
}


