library(reshape)
fichas <- read.csv2("../../dados/ficha_avaliacao_CPG_IB.csv", row.names=1)
fichas$aluno <- factor(fichas$aluno)


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
