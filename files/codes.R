################################################################################
### 0. Preparacao dos dados e funcoes ###
### Inclua aqui todos os objetos de dados e funcoes que criar no
### script e que possam ser reutilizados em diferentes chunks

################################################################################

## @knitr prep
## Secao 1: CARACTERIZACAO DA AMOSTRA
## dataframe dos atributos (curso, programa, etc) de cada aluno
ficha.alun <- ficha[!duplicated(ficha$aluno),1:7]
## Minimos dos indicadores por alunos
ficha.min <- aggregate(ficha[,c(11,13:24)], by=list(aluno=ficha$aluno), min)
## Combina os dois dataframes
ficha.min <- cbind(ficha.alun[match(ficha.min$aluno, ficha.alun$aluno),],ficha.min[,-1])
## Secao 2: QUALIDADE RELATIVA
ficha.min$estrato <- factor(ficha.min$estrato.n, levels=1:4);levels(ficha.min$estrato) <- c("<50%","50%","25%","10%")
ficha.min$impacto <- factor(ficha.min$impacto.n)
levels(ficha.min$impacto) <- c("nao public","baixo","medio","alto")
## Total de alunos por curso
t1b <- table(ficha.min$curso)
## Secao 3: IMPACTO POTENCIAL
## Funcoes
f1 <- function(x, y){
    t1 <- as.matrix(table(x, y))
    sc <- apply(t1,2,sum)
    t2 <- sweep(t1,2,sc, "/")
    list(t1=t1, t2=t2, sc=sc)
}
f2 <- function(x, ...){
    barplot(t(x$t2),beside=T, col=c("darkblue","darkorange"), border=NA,
            xlab="Impacto esperado da melhor publicação",
            ylab="Proporção das teses/dissertações",
            legend.text=c(
                paste("Mestrado (N = ",x$sc["Mestrado"],")",sep=""),
                paste("Doutorado (N = ",x$sc["Doutorado"],")",sep="")),
            args.legend=list(x="topleft", border=NA, bty="n", cex=2),
            names.arg=c("não public.", "baixo", "médio","alto"), ...)
}
f3 <- function(x, ...){
    barplot(t(x$t2),beside=T, col=c("darkblue","darkorange"), border=NA,
            names.arg=rep("", nrow(x$t2)),
            legend.text=c(
                paste("Mestr (N = ",x$sc["Mestrado"],")",sep=""),
                paste("Dout (N = ",x$sc["Doutorado"],")",sep="")),
            args.legend=list(x="topleft", border=NA, bty="n", cex=2),
            ...)
}
## Secao 4-  ITENS DE EXCELÊNCIA NA TESE/DISSERTAÇÃO
## Funcoes
## funcao para o grafico de densidade
f4 <- function(x, sub=TRUE, method="gaussian", ...){
    plot(density(x$nota.tese, kernel=method), ...)
    if(sub){
        w <- table(x$titulo)
        w <- w/sum(w)
        y1 <- density(x$nota.tese[x$titulo=="Mestrado"],
                      kernel=method)
        y1$y <- y1$y*w["Mestrado"]
        y2 <- density(x$nota.tese[x$titulo=="Doutorado"],
                      kernel=method)
        y2$y <- y2$y*w["Doutorado"]
        lines(y1, col="darkblue", lty=2)
        lines(y2, col="darkorange", lty=2)
    }
}
## Funcao para os dotplots
f5 <- function(data, g.id, ...){
    dotplot(value~variable,
            groups=data[,g.id],
            data=data,
            type="p",
            scales=list(
                x=list(rot=c(45,0),cex=2,
                    labels=c("redação","contextualização", "objetivos","hipóteses claras",
                        "originalidade","métodos","análises","resultados","discussão","uso literatura")),
                y=list(cex=2)),
            ylab=list(label="Proporção de teses/dissertações",cex=2), ...)
}
## Tabelas
## Dataframe com Media das indicacoes por item
ficha.mean <- aggregate(ficha[,c(11,13:24)], by=list(aluno=ficha$aluno), mean)
ficha.mean <- cbind(ficha.alun[match(ficha.mean$aluno, ficha.alun$aluno),],ficha.mean[,-1])
ficha.mean.t <- melt(aggregate(ficha.mean[,11:20],
                               by=list(titulo=ficha.mean$titulo),
                               mean, na.rm=TRUE), id.var="titulo")
ficha.mean.te <- melt(aggregate(ficha.mean[,11:20],
                                by=list(titulo=ficha.mean$titulo,
                                    estrato=ficha.mean$estrato.n>3), 
                                mean, na.rm=TRUE),
                      id.var=c("titulo","estrato"))
ficha.mean.tn <- melt(aggregate(ficha.mean[,11:20],
                                by=list(titulo=ficha.mean$titulo,
                                    nota.5=ficha.mean$nota.tese>5), 
                                mean, na.rm=TRUE),
                      id.var=c("titulo","nota.5"))
## planilha: proporcao media de indicadores por titulo e programa
ficha.mean.tp <- melt(aggregate(ficha.mean[,11:20],
                                by=list(titulo=ficha.mean$titulo, programa=ficha.mean$programa),
                                mean, na.rm=TRUE),
                      id.var=c("titulo","programa")) 
## Atraso no deposito em relacao ao prazo de cada programa (em meses)
ficha.mean$atraso.dep <-
    as.numeric(with(ficha.mean,prazo.dep-tempo.dep))
## Classes de atraso em relacao ao prazo de deposito de cada programa:
## atrasado: atraso de mais de um mês
## no prazo: menos de um mês de atraso a 10 dias de antecedencia
## adiantado: mais que 10 dias de antencedência
ficha.mean$atraso.dep.c <- cut(ficha.mean$atraso.dep,
                               breaks=c(
                                   min(ficha.mean$atraso.dep, na.rm=T),
                                   -1, 1/3,
                                   max(ficha.mean$atraso.dep, na.rm=T)
                                   ),
                               labels=c("atrasado", "no prazo",
                                   "adiantado"))

################################################################################
### 1. Caracterização dos dados ###
### DADOS DESCRITIVOS DA AMOSTRA
################################################################################

## @knitr Amostra
## N de defesas por programa e curso: tabela GoogleVis
## Preparacao dos dados:
## Leitura dos dados: cada linha = uma ficha
## load("./files/ficha.RData")
## Sumario por aluno: valor minimo obtido em cada indicador
## entre os atribuido pelos avaliadores
## data.frame para criar a tabela
t1 <- with(ficha.min,addmargins(table(programa, curso)))
class(t1)<-"matrix"
t1 <- as.data.frame(t1)
rownames(t1)[nrow(t1)] <-colnames(t1)[ncol(t1)] <- "Total"
t1<-cbind(Programa=as.character(rownames(t1)),t1)
colnames(t1)[2:4]<-c("Mestr", "Dout", "D.Dir")
## Cria e imprime a tabela Googlevis
tab1<-gvisTable(t1, options=list(width="60%", sort="disable"))
print(tab1, tag="chart")

################################################################################
### 2 . QUALIDADE RELATIVA DA TESE/DISSERTAÇÃO
### Reposta à pergunta:
## Considerando o conjunto de dissertações e teses que você já avaliou
## e orientou, o presente trabalho enquadra-se: 
## Entre os 10% melhores.
## Entre os 25% melhores.
## Entre os 50% melhores.
## Abaixo dos 50% melhores
################################################################################

## @knitr QualiRelM
## Qualidade relativa - Mestrado
## Matrix para a funcao barplot
tab2 <- as.matrix(table(ficha.min$estrato[ficha.min$titul=="Mestrado"]))
tab2 <- cbind(tab2,sum(tab2[,1])*c(0.5,0.25,0.15,0.1))
par(mfrow=c(1,1), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
barplot(t(tab2),beside=T, col=c("darkblue","grey"), border=NA,
        #main="Mestrado",
        xlab="Quantil de qualidade da dissertação",
        ylab="N de dissertações",
        legend.text=c("Observado","Esperado"), args.legend=list(border=NA,bty="n", cex=2))

## @knitr QualiRelD
## Qualidade relativa dos doutorados
## Matrix para a funcao barplot
tab3 <- as.matrix(table(ficha.min$estrato[ficha.min$titul=="Doutorado"]))
tab3 <- cbind(tab3,sum(tab3[,1])*c(0.5,0.25,0.15,0.1))
par(cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
barplot(t(tab3),beside=T, col=c("darkblue","grey"), border=NA,
        #main="Doutorado",
        xlab="Quantil de qualidade da tese",
        ylab="N de teses",
        legend.text=c("Observado","Esperado"), args.legend=list(border=NA,bty="n", cex=2))

## @knitr QualiRelTimeM
## Quantis de qualidade por ano Mestrado
tab2yM <- with(subset(ficha.min, titulo="Mestrado"), f1(estrato, ano.defesa))
par(cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
matplot(y= t(as.matrix(tab2yM$t2)), x=colnames(tab2yM$t2),
        ylab="Proporção de dissertações", xlab="", type="b", pch=1, lty=2, lwd=1, cex=1.5)
legend("topleft", legend=rownames(tab2yM$t2), pch=1, col=1:ncol(tab2yM$t2),
       bty="n", title="Quantil de qualidade", cex=1.25)
axis(1, at=as.integer(colnames(tab2yM$t2)), labels=paste("n = ", tab2yM$sc), line=2, tick=FALSE, lty=0, cex.axis=1.5)

## @knitr QualiRelTimeD
## Quantis de qualidade por ano Doutorado
tab2yD <- with(subset(ficha.min, titulo=="Doutorado"), f1(estrato, ano.defesa))
par(cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
matplot(y= t(as.matrix(tab2yD$t2)), x=colnames(tab2yD$t2),
        ylab="Proporção de teses", xlab="", type="b", pch=1, lty=2, lwd=1, cex=1.5,
        ylim=c(min(tab2yD$t2), max(tab2yD$t2)+0.1))
legend("topleft", legend=rownames(tab2yD$t2),
       pch=1, col=1:ncol(tab2yD$t2),
       bty="n", title="Quantil de qualidade", cex=1.25)
axis(1, at=as.integer(colnames(tab2yD$t2)), labels=paste("n = ", tab2yD$sc), line=2, tick=FALSE, lty=0, cex.axis=1.5)


################################################################################
### 3 . IMPACTO POTENCIAL DA TESE/DISSERTAÇÃO
### Reposta à pergunta:
## O melhor artigo decorrente da dissertação ou tese poderia ser
## publicado em periódico em qual categoria de fator de impacto em sua
## área: 
## Impacto alto
## Impacto médio
## Impacto baixo 
## Há baixa chance de publicação 
################################################################################

#3a. Graficos gerais

## @knitr ImpactoMD
## Grafico de barras de n de teses e dissertacoes por classe de impacto potencial
## Tabela de contagens por titulacao
l1 <- f1(ficha.min$impacto, ficha.min$titul)
## Grafico de barras lado a lado para mestrado e doutorado
par(mfrow=c(1,1), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
f2(l1)

## 3b. Comparacao entre programas

## @knitr ImpactoMDProgramas
## Grafico de barras para Impacto potencial por programa
## Matrix para a funcao barplot
nomes <- levels(ficha.min$programa)
lista1 <- lapply(nomes, function(x) with(subset(ficha.min, x==nomes), f1(impacto, titulo)))
names(lista1) <- nomes
m1 <- range(sapply(lista1,function(x)range(x$t2)))
par(mfrow=c(2,3), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
for(n in nomes){
f3(lista1[[n]], main=n, ylim=m1)
}

## @knitr ImpactoTimeD
l1yD <- with(subset(ficha.min,ficha.min$titulo=="Doutorado"), f1(impacto, ano.defesa))
par(cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
matplot(y= t(as.matrix(l1yD$t2)), x=colnames(l1yD$t2),
        ylab="Proporção de teses", xlab="", type="b", pch=1, lty=2, lwd=1, cex=1.5)
legend("topleft", legend=rownames(l1yD$t2),
       pch=1, col=1:ncol(l1yD$t2),
       bty="n", title="Impacto potencial", cex=1.25)
axis(1, at=as.integer(colnames(l1yD$t2)), labels=paste("n = ", l1yD$sc), line=2, tick=FALSE, lty=0, cex.axis=1.5)


## @knitr ImpactoTimeM
l1yM <- with(subset(ficha.min,ficha.min$titulo=="Mestrado"), f1(impacto, ano.defesa))
par(cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
matplot(y= t(as.matrix(l1yM$t2)), x=colnames(l1yM$t2),
        ylab="Proporção de dissertações", xlab="", type="b", pch=1, lty=2, lwd=1, cex=1.5)
legend("topleft", legend=rownames(l1yM$t2),
       pch=1, col=1:ncol(l1yM$t2),
       bty="n", title="Impacto potencial", cex=1.25)
axis(1, at=as.integer(colnames(l1yM$t2)), labels=paste("n = ", l1yM$sc), line=2, tick=FALSE, lty=0, cex.axis=1.5)

################################################################################
### 4 . ITENS DE EXCELÊNCIA NA TESE/DISSERTAÇÃO
### Resposta à pergunta:
## Quais dos quesitos a seguir o trabalho satisfaz de maneira muito
## boa ou excelente? Não marque nenhuma opção caso nenhuma delas se
## aplique ou marque mais de uma se achar adequado. 
##
## O texto é claro, conciso e com boa qualidade quanto a ortografia e gramática.
## O trabalho é bem contextualizado teoricamente.
## Os objetivos são bem definidos e condizentes com o título pleiteado.
## As perguntas e/ou hipóteses são claras e explicitamente apresentadas no texto.
## A idéia é original e traz uma contribuição teórica e/ou empírica relevante.
## Os métodos são bem descritos e adequados para responder à(s) pergunta(s).
## As análises são bem descritas e adequadas para responder à(s) pergunta(s).
## Os resultados são bem apresentados e respondem à(s) pergunta(s).
## A discussão é sólida e fortemente alicerçada nos resultados obtidos.
## A literatura citada é adequada e atualizada.
################################################################################

### 4A. Graficos gerais

## @knitr DensityNotas
## distribuicao das notas (soma das indicacoes de excelencia na questao 3)
## Grafico com densidade geral e separada por titulacao
par(mfrow=c(1,1),cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2),
    mgp=c(5,1,0),bty = "l", las=1, lwd=2.5)
f4(ficha.min, sub=TRUE, xlab="Notas (Soma de indicações)", ylab="", lwd=2.5, main="")
legend("topleft", c("Total", "Mestrado", "Doutorado"),
       lty=c(1,2,2), lwd=2.5,
       col=c("black", "darkblue", "darkorange"),
       cex=2, bty="n")


## @knitr NotasTimeM
## distribuicao das notas (soma das indicacoes de excelencia na questao 3)
## Grafico com densidade geral e separada por titulacao
par(mfrow=c(1,1), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(4,1,0),bty = "l", las=1, lwd=3)
b1 <- boxplot(nota.tese ~ ano.defesa, data=ficha.min, subset=titulo=="Mestrado", ylab="Notas (Soma de indicações)",
              xlab="", ylim=c(0,10.5), axes=FALSE, border="darkblue")
text(1:length(b1$n), 10.25, pos=3, paste("n=", b1$n), cex=1.5)
axis(2)
axis(1, line=1.25, at=1:length(b1$names), labels= b1$names, font=2, tick=FALSE, )


## @knitr NotasTimeD
## distribuicao das notas (soma das indicacoes de excelencia na questao 3)
## Grafico com densidade geral e separada por titulacao
par(mfrow=c(1,1), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(4,1,0),bty = "l", las=1, lwd=3)
b1 <- boxplot(nota.tese ~ ano.defesa, data=ficha.min, subset=titulo=="Doutorado", ylab="Notas (Soma de indicações)",
              xlab="", ylim=c(0,10.5), axes=FALSE, border="darkblue")
text(1:length(b1$n), 10.25, pos=3, paste("n=", b1$n), cex=1.5)
axis(2)
axis(1, line=1.25, at=1:length(b1$names), labels= b1$names, font=2, tick=FALSE, )



## @knitr DotplotMD
## Dotplot de Proporcao media de indicacoes por item e titulo
trellis.par.set(superpose.line=list(lwd=2),
                superpose.symbol=list(pch=19, cex=2.5))
f5(data=ficha.mean.t, g.id=1, auto.key=list(cex=1.8, columns=2),
   superpose.line=list(lwd=2), superpose.symbol=list(pch=19, cex=2.5)) 

## @knitr DotplotExtratoM
##dotplot de proporcao de indicacoes por item nos mestrados no ultimo quartil de qualidade contra as demais
trellis.par.set(superpose.line=list(lwd=2), superpose.symbol=list(pch=19, cex=2.5))
f5(data=subset(ficha.mean.te, ficha.mean.te$titulo=="Mestrado"), g.id=2,
   auto.key=list(text=c("Primeiros quartis",
                     "Último quartil"),cex=1.8, columns=2))

## @knitr DotplotExtratoD
##dotplot de proporcao de indicacoes por item nos doutorados no ultimo quartil de qualidade contra as demais
trellis.par.set(superpose.line=list(lwd=2), superpose.symbol=list(pch=19, cex=2.5))
f5(data=subset(ficha.mean.te, ficha.mean.tn$titulo=="Doutorado"), g.id=2,
   auto.key=list(text=c("Primeiros quartis", "Último quartil"),
       cex=1.8, columns=2), superpose.line=list(lwd=2),
   superpose.symbol=list(pch=19, cex=2.5)) 

## @knitr DotplotNotaM
##dotplot de proporcao de indicacoes nos mestrados com nota>5 e nota<=5
##qualidade contra as demais, nos mestrados
## O dotplot
trellis.par.set(superpose.line=list(lwd=2), superpose.symbol=list(pch=19, cex=2.5))
f5(data=subset(ficha.mean.te, ficha.mean.tn$titulo=="Mestrado"), g.id=2,
   auto.key=list(text=c("nota<5", "nota>5"), cex=1.8, columns=2))

## @knitr DotplotNotaD
##dotplot de proporcao de indicacoes por item nos doutorados com de nota>5 e <5
## Dotplot
trellis.par.set(superpose.line=list(lwd=2), superpose.symbol=list(pch=19, cex=2.5))
f5(data=subset(ficha.mean.tn, ficha.mean.tn$titulo=="Doutorado"),
   g.id=2,
   auto.key=list(text=c("nota<5", "nota>5"), cex=1.8, columns=2))


### 4B. Comparações entre programas ###

## @knitr DensityNotasProgramas
## Graficos de densidade: um por programa, mestrados e doutorados juntos
par(mfrow=c(2,3), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1, lwd=2.5)
for(n in nomes) f4(ficha.min[ficha.min$programa==n,], sub=FALSE, main=n, xlab="", ylab="", lwd=2.5)

## @knitr DensityNotasProgramasMD
## Distribuicao das notas por programa: com mestrados e doutorados separados
par(mfrow=c(2,3), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1, lwd=2.5)
for(n in nomes) f4(ficha.min[ficha.min$programa==n,], main=n, xlab="", ylab="")
plot(0:1,0:1, type="n", axes=F, xlab="", ylab="")
legend("topleft", c("Total", "Mestrado", "Doutorado"),
       lty=c(1,2,2), lwd=2.5,
       col=c("black", "darkblue", "darkorange"),
       cex=3)

## @knitr DotplotProgramasM
## Dotplot de Proporcao media de indicacoes por item e titulo
## Dotplots para os mestrados por programa
## o dotplot
trellis.par.set(superpose.line=list(lwd=2),
                superpose.symbol=list(pch=substr(unique(ficha.mean.tp$programa),1,1),
                    font=2,
                    cex=2.5)) 
f5(data=subset(ficha.mean.tp,titulo=="Mestrado"), g.id=2, auto.key=list(cex=1.8, columns=5))

## @knitr DotplotProgramasD
## Dotplots para os doutorados por programa
trellis.par.set(superpose.line=list(lwd=2),
                superpose.symbol=list(pch=substr(unique(ficha.mean.tp$programa),1,1),
                    font=2,
                    cex=2.5))
f5(data=subset(ficha.mean.tp,titulo=="Doutorado"), g.id=2, auto.key=list(cex=1.8, columns=5))

## @knitr TempoNotaM
par(mfrow=c(1,1), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(4,1,0),bty = "l", las=1, lwd=3)
y <- subset(ficha.mean, subset=titulo=="Mestrado")
y.tab <- table(y$atraso.dep.c)
boxplot(nota.tese~atraso.dep.c, data=y, ylab="Nota da dissertação",
        notch=FALSE, border="darkblue", axes=FALSE)
axis(side=2)
axis(side=1, at=1:3, tick=FALSE, labels=names(y.tab), line=1.25, font=2)
axis(side=1, at=1:3, labels=paste("(N=",y.tab,")",sep=""), tick=FALSE, line=3.25)

## @knitr TempoNotaD
par(mfrow=c(1,1), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(4,1,0),bty = "l", las=1, lwd=3)
y <- subset(ficha.mean, subset=titulo=="Doutorado")
y.tab <- table(y$atraso.dep.c)
boxplot(nota.tese~atraso.dep.c, data=y, ylab="Nota da tese",
        notch=FALSE, border="darkblue", axes=FALSE)
axis(side=2)
axis(side=1, at=1:3, tick=FALSE, labels=names(y.tab), line=1.25, font=2)
axis(side=1, at=1:3, labels=paste("(N=",y.tab,")",sep=""), tick=FALSE, line=3.25)


## @knitr NotaMax
## Preliminar: com que frequencia o orientador dá a melhor nota?
## Por programa e titulo
df1 <- melt(ficha[ficha$ano.defesa==2013,c("aluno","programa","titulo","avaliador","nota.tese")],
            id.vars=c("aluno","programa","titulo","avaliador"),
            var.names="nota.tese")
df2 <- cast(df1, aluno+programa+titulo~avaliador, max, na.rm=T)
df2$nota.max <- apply(df2[,4:6],1,max)
df3 <- cast(df1, aluno+programa+titulo~avaliador, function(x)length(unique(x)))
df3$num.notas <- apply(df3[,4:6],1,sum, na.rm=T)
df2$num.notas <- df3$num.notas[match(df2$aluno,df3$aluno)]
df2$p.max <- 1/df2$num.notas
tab6 <- aggregate(df2$Orientador==df2$nota.max,
                  by=list(programa=df2$programa, titulo=df2$titulo),
                  function(x)sum(x)/length(x))
names(tab6)[3] <- "p.max.orient"
tab6$N <- aggregate(df2$Orientador==df2$nota.max,
                  by=list(programa=df2$programa, titulo=df2$titulo),
                  length)$x
tab6$p.max <- aggregate(df2$p.max,
                  by=list(programa=df2$programa, titulo=df2$titulo),
                  mean)$x
## Apenas por programa
df4 <- cast(df1, aluno+programa~avaliador, max, na.rm=T)
df4$nota.max <- apply(df4[,3:5],1,max)
df5 <- cast(df1, aluno+programa~avaliador, function(x)length(unique(x)))
df5$num.notas <- apply(df5[,3:5],1,sum, na.rm=T)
df4$num.notas <- df5$num.notas[match(df4$aluno,df5$aluno)]
df4$p.max <- 1/df4$num.notas
tab7 <- aggregate(df4$Orientador==df4$nota.max,
                  by=list(programa=df4$programa),
                  function(x)sum(x)/length(x))
names(tab7)[2] <- "p.max.orient"
tab7$N <- aggregate(df4$Orientador==df4$nota.max,
                  by=list(programa=df4$programa),
                  length)$x
tab7$p.max <- aggregate(df4$p.max,
                  by=list(programa=df4$programa),
                  mean)$x
## Apenas por titulo
df6 <- cast(df1, aluno+titulo~avaliador, max, na.rm=T)
df6$nota.max <- apply(df6[,3:5],1,max)
df7 <- cast(df1, aluno+titulo~avaliador, function(x)length(unique(x)))
df7$num.notas <- apply(df7[,3:5],1,sum, na.rm=T)
df6$num.notas <- df7$num.notas[match(df6$aluno,df7$aluno)]
df6$p.max <- 1/df6$num.notas
tab8 <- aggregate(df6$Orientador==df6$nota.max,
                  by=list(titulo=df6$titulo),
                  function(x)sum(x)/length(x))
names(tab8)[2] <- "p.max.orient"
tab8$N <- aggregate(df6$Orientador==df6$nota.max,
                  by=list(titulo=df6$titulo),
                  length)$x
tab8$p.max <- aggregate(df6$p.max,
                  by=list(titulo=df6$titulo),
                  mean)$x


