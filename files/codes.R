## @knitr amostra
## N de defesas por programa e curso: tabela GoogleVis
## Preparacao dos dados:
## Leitura dos dados: cada linha = uma ficha
load("./files/ficha.RData")
## Sumario por aluno: valor minimo obtido em cada indicador
## entre os atribuido pelos avaliadores
## dataframe dos atributos (curso, programa, etc) de cada aluno
ficha.alun <- ficha[!duplicated(ficha$aluno),1:7]
## Minimos dos indicadores por alunos
ficha.min <- aggregate(ficha[,c(11,13:24)], by=list(aluno=ficha$aluno), min)
## Combina os dois dataframes
ficha.min <- cbind(ficha.alun[match(ficha.min$aluno, ficha.alun$aluno),],ficha.min[,-1])
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

## @knitr QRM
## Qualidade relativa - Mestrado
ficha.min$estrato <- factor(ficha.min$estrato.n, levels=1:4);levels(ficha.min$estrato) <- c("<50%","50%","25%","10%")
ficha.min$impacto <- factor(ficha.min$impacto.n); levels(ficha.min$impacto) <- c("nao public","baixo","medio","alto")
## Matrix para a funcao barplot
tab2 <- as.matrix(table(ficha.min$estrato[ficha.min$titul=="Mestrado"]))
tab2 <- cbind(tab2,sum(tab2[,1])*c(0.5,0.25,0.15,0.1))
par(mfrow=c(1,1), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
barplot(t(tab2),beside=T, col=c("darkblue","grey"), border=NA,
        #main="Mestrado",
        xlab="Quantil de qualidade da dissertação",
        ylab="N de dissertações",
        legend.text=c("Observado","Esperado"), args.legend=list(border=NA,bty="n", cex=2))

## @knitr QRD
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

## @knitr IMP
## Impacto potencial
## Matrix para a funcao barplot
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
l1 <- f1(ficha.min$impacto, ficha.min$titul)
par(mfrow=c(1,1), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
f2(l1)

## @knitr IMPP
## Impacto potencial por programa
## Matrix para a funcao barplot
f3 <- function(x, ...){
    barplot(t(x$t2),beside=T, col=c("darkblue","darkorange"), border=NA,
            names.arg=rep("", nrow(x$t2)),
            legend.text=c(
                paste("Mestr (N = ",x$sc["Mestrado"],")",sep=""),
                paste("Dout (N = ",x$sc["Doutorado"],")",sep="")),
            args.legend=list(x="topleft", border=NA, bty="n", cex=2),
            ...)
}
nomes <- levels(ficha.min$programa)
lista1 <- lapply(nomes, function(x) with(subset(ficha.min, x==nomes), f1(impacto, titulo)))
names(lista1) <- nomes
m1 <- range(sapply(lista1,function(x)range(x$t2)))
par(mfrow=c(2,3), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
for(n in nomes){
f3(lista1[[n]], main=n, ylim=m1)
}

## @knitr DNOTAS
f4 <- function(x, sub=TRUE, method="gaussian",...){
    plot(density(x$nota.tese, kernel=method), ...)
    if(sub){
        w <- table(x$titulo)
        w <- w/sum(w)
        y1 <- density(x$nota.tese[x$titulo=="Mestrado"], kernel=method)
        y1$y <- y1$y*w["Mestrado"]
        y2 <- density(x$nota.tese[x$titulo=="Doutorado"], kernel=method)
        y2$y <- y2$y*w["Doutorado"]
        lines(y1, col="darkblue", lty=2)
        lines(y2, col="darkorange", lty=2)
    }
}
par(mfrow=c(2,3), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1, lwd=2.5)
for(n in nomes) f4(ficha.min[ficha.min$programa==n,], sub=FALSE, main=n, xlab="", ylab="", lwd=2.5)

## @knitr DNOTASP
par(mfrow=c(2,3), cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1, lwd=2.5)
for(n in nomes) f4(ficha.min[ficha.min$programa==n,], main=n, xlab="", ylab="")
plot(0:1,0:1, type="n", axes=F, xlab="", ylab="")
legend("topleft", c("Total", "Mestrado", "Doutorado"),
       lty=c(1,2,2), lwd=2.5,
       col=c("black", "darkblue", "darkorange"),
       cex=3)

## @knitr NOTAMAX
## Preliminar: com que frequencia o orientador da a melhor nota?
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

