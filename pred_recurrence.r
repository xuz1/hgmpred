library(randomForestSRC)
rec<-readRDS("recurrence.rds")
input<-read.csv("input_recurrence.csv")
pred_rec <- predict(rec, newdata = input,na.action="na.impute")

for(i in 1:nrow(input)){
jpeg(paste0("pred_recurrence_",i,".jpg"),width=600,height=600,quality=100)
plot(pred_rec$time.interest,100*pred_rec$survival[i,],ylim=c(0,100),xlab="Time after surgery (month)",ylab="Survival probability (%)",main="",lty=1,type="l")
dev.off()
}

