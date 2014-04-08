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
par(cex.axis = 2, cex.lab = 2.25, cex.main=2.5, mar = c(6,6.5,4,2), mgp=c(5,1,0),bty = "l", las=1)
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
