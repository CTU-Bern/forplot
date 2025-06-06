#to generate example dataset
set.seed(1)
forplotdata<-numeric(0)
for (i in 1:10) {
	n0<-100
	n1<-100
	nt<-n0+n1
	dat0<-rnorm(n0,5,1)
	dat1<-rnorm(n1,5.5,1)
	tt<-t.test(dat0,dat1)
	out<-data.frame(vlabel=paste0("out",i),
		n1=n0,
		n2=paste0(sprintf("%1.1f",mean(dat0))," (",sprintf("%1.1f",sd(dat0)),")"),
		n3=n1,
		n4=paste0(sprintf("%1.1f",mean(dat1))," (",sprintf("%1.1f",sd(dat1)),")"),
		beta=mean(dat0)-mean(dat1),beta_lci=tt$conf.int[1],beta_uci=tt$conf.int[2],
		p1=sprintf("%0.3f",tt$p.value))
	forplotdata<-rbind(forplotdata,out)
}

usethis::use_data(forplotdata, overwrite = TRUE)
