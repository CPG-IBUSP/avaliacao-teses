---

title       : Avaliação das teses e dissertações
subtitle    : Dados agregados de todos os programas
author      : Comissão de Pós-Graduação
job         : Instituto de Biociências da Universidade de São Paulo
widgets     : [bootstrap, interactive]# {mathjax, quiz, bootstrap}
framework   : io2012        # {deckjs, io2012, html5slides, shower, dzslides, ...}
hitheme: tomorrow
logo: logo_ib_transparente_small.png
biglogo: logo_ib_transparente.png
mode        : selfcontained # {standalone, draft}
assets: {js: 'test.js'}
url: {lib: ./libraries}
github:
  user: CPG-IBUSP
  repo: avaliacao-teses
 
---






## NAVEGAÇÃO:

 - Para menu de slides pressione 'o'
 - Para legenda dos gráficos pressione 'p'
 - [Página principal](../index.html)
 - Resultados por programa:
   - [Botânica](../botanica/slides_botanica.html)
   - [Ecologia](../ecologia/slides_ecologia.html)
   - [Fisiologia](../fisiologia/slides_fisiologia.html)
   - [Genética](../genetica/slides_genetica.html)
   - [Zoologia](../zoologia/slides_zoologia.html)

---

## Tamanho da amostra
### Defesas entre 2011 e 2013
<!-- Table generated in R 3.1.0 by googleVis 0.5.1 package -->
<!-- Tue Apr 15 02:11:47 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTableIDaf05786d2ff () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Bot",
45,
18,
3,
66 
],
[
 "Eco",
44,
15,
2,
61 
],
[
 "Fis",
33,
18,
3,
54 
],
[
 "Gen",
36,
40,
11,
87 
],
[
 "Zoo",
54,
26,
1,
81 
],
[
 "Total",
212,
117,
20,
349 
] 
];
data.addColumn('string','Programa');
data.addColumn('number','Mestr');
data.addColumn('number','Dout');
data.addColumn('number','D.Dir');
data.addColumn('number','Total');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartTableIDaf05786d2ff() {
var data = gvisDataTableIDaf05786d2ff();
var options = {};
options["allowHtml"] = true;
options["width"] = "60%";
options["sort"] = "disable";

    var chart = new google.visualization.Table(
    document.getElementById('TableIDaf05786d2ff')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "table";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartTableIDaf05786d2ff);
})();
function displayChartTableIDaf05786d2ff() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTableIDaf05786d2ff"></script>
 
<!-- divChart -->
  
<div id="TableIDaf05786d2ff"
  style="width: 60%px; height: 500px;">
</div>

---

## Pergunta sobre qualidade relativa
Considerando o conjunto de dissertações e teses que você já avaliou e orientou, 
o presente trabalho enquadra-se: 
- Entre os 10% melhores.
- Entre os 25% melhores.
- Entre os 50% melhores.
- Abaixo dos 50% melhores

---

## Qualidade relativa - Mestrado
![plot of chunk QualiRelM](assets/fig/QualiRelM.png) 


*** =pnotes

**Número de teses/dissertações defendidas entre
 2011 e 2013, por classe de qualidade.**

A avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram a qualidade do trabalho relativa a todos que 
já orientou ou avaliou, entre quatro classes:

- Abaixo dos 50% melhores que já avaliou/orientou
- Entre os 50% melhores
- Entre os 25% melhores
- Entre os 10% melhores

Quando houve resposta de mais de um avaliador, foi considerada 
a categoria de menor qualidade, entre as indicadas.

Também indicado o número esperado em cada categoria se o conjunto avaliado
e o já conhecido pela banca forem iguais em qualidade.



---

## Qualidade relativa - Doutorado
![plot of chunk QualiRelD](assets/fig/QualiRelD.png) 


*** =pnotes

**Número de teses/dissertações defendidas entre
 2011 e 2013, por classe de qualidade.**

A avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram a qualidade do trabalho relativa a todos que 
já orientou ou avaliou, entre quatro classes:

- Abaixo dos 50% melhores que já avaliou/orientou
- Entre os 50% melhores
- Entre os 25% melhores
- Entre os 10% melhores

Quando houve resposta de mais de um avaliador, foi considerada 
a categoria de menor qualidade, entre as indicadas.

Também indicado o número esperado em cada categoria se o conjunto avaliado
e o já conhecido pela banca forem iguais em qualidade.

---

## Pergunta sobre impacto potencial

O melhor artigo decorrente da dissertação ou tese poderia ser
publicado em periódico em qual categoria de fator de impacto em sua
área:  
- Impacto alto
- Impacto médio
- Impacto baixo 
- Há baixa chance de publicação 

---

## Impacto potencial
![plot of chunk ImpactoMD](assets/fig/ImpactoMD.png) 


*** =pnotes

**Proporção de teses e dissertações defendidas entre  2011 e 2013 , 
por classe de impacto.**

A avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram o impacto potencial da melhor publicação resultante da tese/dissertação, entre quatro classes:

- Há baixa chance de publicação 
- Impacto baixo 
- Impacto médio
- Impacto alto

Quando houve resposta de mais de um avaliador, foi considerada 
a categoria mais baixa entre as indicadas.

---

## Pergunta sobre itens de destaque
Quais dos quesitos a seguir o trabalho satisfaz de maneira muito
boa ou excelente? Não marque nenhuma opção caso nenhuma delas se
aplique ou marque mais de uma se achar adequado. 
- O texto é claro, conciso e com boa qualidade quanto a ortografia e gramática.
- O trabalho é bem contextualizado teoricamente.
- Os objetivos são bem definidos e condizentes com o título pleiteado.
- As perguntas e/ou hipóteses são claras e explicitamente apresentadas no texto.
- A idéia é original e traz uma contribuição teórica e/ou empírica relevante.

(continua)

---

## Pergunta itens de destaque (cont.)
Quais dos quesitos a seguir o trabalho satisfaz de maneira muito
boa ou excelente? Não marque nenhuma opção caso nenhuma delas se
aplique ou marque mais de uma se achar adequado. 

- Os métodos são bem descritos e adequados para responder à(s) pergunta(s).
- As análises são bem descritas e adequadas para responder à(s) pergunta(s).
- Os resultados são bem apresentados e respondem à(s) pergunta(s).
- A discussão é sólida e fortemente alicerçada nos resultados obtidos.
- A literatura citada é adequada e atualizada.

---

## Distribuição das notas
![plot of chunk DensityNotas](assets/fig/DensityNotas.png) 


*** =pnotes

**Distribuição das notas das dissertações de mestrado e teses de doutorado 
defendidas entre  2011 e 2013 .**

A avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa: 
redação, contextualização teórica, objetivos bem definidos, pergunta/hipóteses claras, 
originalidade e relevância, métodos bem descritos e adequados, 
análises bem descritas e adequadas, 
resultados bem apresentados e conclusivos, discussão lógica e bem fundamentada, uso adequado da literatura.

As notas são as médias do número de indicações por tese/dissertação.
As curvas são [kernels de densidade probabilística](http://en.wikipedia.org/wiki/Kernel_density_estimation), 
uma alternativa preferível a histogramas
para representar distribuições de frequência.


---

## Proporção de indicações por item
![plot of chunk DotplotMD](assets/fig/DotplotMD.png) 


*** =pnotes

**Proporção de teses e dissertações consideradas excelentes em dez quesitos
( defesas entre 2011 e 2013 ).**

Avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa: 
redação, contextualização teórica, objetivos bem definidos, pergunta/hipóteses claras, 
originalidade e relevância, métodos bem descritos e adequados, 
análises bem descritas e adequadas, 
resultados bem apresentados e conclusivos, discussão lógica e bem fundamentada, uso adequado da literatura.

Para o cálculo das proporções, primeiro foram obtidas as médias de indicações de excelência  
em cada quesito, por aluno. Em seguida foi calculada a média desses valores para os mestrados e doutorados, para cada item.




---

## Quartis de qualidade (Mestrado)

![plot of chunk DotplotExtratoM](assets/fig/DotplotExtratoM.png) 

***=pnotes

**Proporção de teses e dissertações consideradas excelentes em dez quesitos: 
comparação entre os melhores trabalhos e os demais. 
(Defesas entres 2011 e 2013 )**

Avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa 
(detalhes nos slides anteriores).
Para o cálculo das proporções, primeiro foram obtidas as médias de indicações de excelência  
em cada quesito, por aluno. Em seguida foi calculada a média desses valores para dois grupos:

- **Primeiros quartis**: abaixo dos 25% melhores trabalhos já avaliados pelo membro da banca;
- **Último quartil**: entre os 25% ou 10% melhores trabalhos já avaliados pelo membro da banca.




---

## Quartis de qualidade (Doutorado)

![plot of chunk DotplotExtratoD](assets/fig/DotplotExtratoD.png) 

***=pnotes

**Proporção de teses e dissertações consideradas excelentes em dez quesitos: 
comparação entre os melhores trabalhos e os demais. 
(Defesas entres 2011 e 2013 )**

Avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa 
(detalhes nos slides anteriores).
Para o cálculo das proporções, primeiro foram obtidas as médias de indicações de excelência  
em cada quesito, por aluno. Em seguida foi calculada a média desses valores para dois grupos:

- **Primeiros quartis**: abaixo dos 25% melhores trabalhos já avaliados pelo membro da banca;
- **Último quartil**: entre os 25% ou 10% melhores trabalhos já avaliados pelo membro da banca.



---

## Prazo de depósito e nota (Mestrado)
![plot of chunk TempoNotaM](assets/fig/TempoNotaM.png) 

***=pnotes

**Notas das dissertações e teses 
defendidas entre 2011 e 2013, em função do tempo de conclusão.**

Avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa 
(itens detalhados nos slides anteriores).
As notas são as médias do número de indicações por tese/dissertação, de três grupos:

- Atrasado: tese/dissertação depositada após mais de 30 dias do prazo regimental.
- No prazo: depositada entre 30 dias após a 10 dias antes do prazo.
- Adiantado: depósito com antecedência de mais de 10 dias do prazo.

Os atrasos devem-se a prorrogações e trancamentos, que  
ultrapassam os prazos regimentais. 

---

## Prazo de depósito e nota (Doutorado)
![plot of chunk TempoNotaD](assets/fig/TempoNotaD.png) 

***=pnotes

**Notas das dissertações e teses 
defendidas entre 2011 e 2013, em função do tempo de conclusão.**

Avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa 
(itens detalhados nos slides anteriores).
As notas são as médias do número de indicações por tese/dissertação, de três grupos:

- Atrasado: tese/dissertação depositada após mais de 30 dias do prazo regimental.
- No prazo: depositada entre 30 dias após a 10 dias antes do prazo.
- Adiantado: depósito com antecedência de mais de 10 dias do prazo.

Os atrasos devem-se a prorrogações e trancamentos, que  
ultrapassam os prazos regimentais. 
