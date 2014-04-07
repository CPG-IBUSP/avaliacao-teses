library(reshape)
library(Hmisc)
require(googleVis)
## Carrega os dados
load("files/ficha.RData")

## Minimos por aluno
ficha.alun <- ficha[!duplicated(ficha$aluno),1:7]
ficha.min <- aggregate(ficha[,c(11,13:24)], by=list(aluno=ficha$aluno), min)
ficha.min <- cbind(ficha.alun[match(ficha.min$aluno, ficha.alun$aluno),],ficha.min[,-1])

##Tabela com n de teses por programa
## Prepacao dos dados
ficha.alun <- ficha[!duplicated(ficha$aluno),1:7]
ficha.min <- aggregate(ficha[,c(11,13:24)], by=list(aluno=ficha$aluno), min)
ficha.min <- cbind(ficha.alun[match(ficha.min$aluno, ficha.alun$aluno),],ficha.min[,-1])
t1 <- with(ficha.min,addmargins(table(programa, curso)))
class(t1)<-"matrix"
t1 <- as.data.frame(t1)
rownames(t1)[nrow(t1)] <-colnames(t1)[ncol(t1)] <- "Total"
t1<-cbind(Programa=as.character(rownames(t1)),t1)
colnames(t1)[2:4]<-c("Mestr", "Dout", "D.Dir")
tab1<-gvisTable(t1, options=list(width="60%", sort="disable"))
print(tab1, tag="chart")

## Grafico de barras de teses por classe de qualidade dos externos
tab2 <- as.data.frame(with(ficha.min,table(paste(programa,titulo),estrato.n)))
f1 <- Rickshaw$new()
f1$layer(Freq ~ estrato.n, group = 'Var1', data = tab2, type = 'area')
f1

## Modelo glmer para efeito de tipo de avaliador
library(lme4)
library(bbmle)
tmp <- subset(fichas, ano.defesa>2012)
m0 <- glmer(discussao~(1|aluno), data=tmp, family=binomial)
m1 <-  glmer(discussao~avaliador+(1|aluno), data=tmp, family=binomial)
m2 <- glmer(discussao~avaliador+titul.2+(1|aluno), data=tmp, family=binomial)
m3 <- glmer(discussao~avaliador+programa+(1|aluno), data=tmp, family=binomial)
m4 <- glmer(discussao~avaliador*programa+(1|aluno), data=tmp, family=binomial)
AICtab(m0,m1,m2,m3,m4)

tmp2 <- melt(tmp, id.vars=c("aluno","avaliador"), measure.vars="discussao")
tmp3 <- cast(tmp2, value~aluno|variable)
