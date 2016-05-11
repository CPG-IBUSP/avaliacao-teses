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
### Defesas entre 2011 e 2015

<!-- Table generated in R 3.2.4 by googleVis 0.5.10 package -->
<!-- Wed May 11 11:41:00 2016 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTableID4e5d57a480fd () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Bot",
65,
36,
6,
107 
],
[
 "Eco",
70,
29,
2,
101 
],
[
 "Fis",
52,
36,
3,
91 
],
[
 "Gen",
57,
53,
17,
127 
],
[
 "Zoo",
77,
46,
1,
124 
],
[
 "Total",
321,
200,
29,
550 
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
function drawChartTableID4e5d57a480fd() {
var data = gvisDataTableID4e5d57a480fd();
var options = {};
options["allowHtml"] = true;
options["sort"] = "disable";

    var chart = new google.visualization.Table(
    document.getElementById('TableID4e5d57a480fd')
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
callbacks.push(drawChartTableID4e5d57a480fd);
})();
function displayChartTableID4e5d57a480fd() {
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
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTableID4e5d57a480fd"></script>
 
<!-- divChart -->
  
<div id="TableID4e5d57a480fd" 
  style="width: 60%; height: automatic;">
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
![plot of chunk QualiRelM](assets/fig/QualiRelM-1.png)

*** =pnotes

**Número de teses/dissertações defendidas entre
 2011 e 2015, por classe de qualidade.**

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
![plot of chunk QualiRelD](assets/fig/QualiRelD-1.png)

*** =pnotes

**Número de teses/dissertações defendidas entre
 2011 e 2015, por classe de qualidade.**

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

## Evolução da Qualidade relativa - Doutorado
![plot of chunk QualiRelTimeD](assets/fig/QualiRelTimeD-1.png)

*** =pnotes

**Evolução da proporção de teses/dissertações defendidas entre
 2011 e 2015 em cada classe de qualidade.**

A avaliação anônima foi feita pelos participantes das bancas de defesa, 
que indicaram a qualidade do trabalho relativa a todos que 
já orientou ou avaliou, entre quatro classes:

- Abaixo dos 50% melhores que já avaliou/orientou
- Entre os 50% melhores
- Entre os 25% melhores
- Entre os 10% melhores

Quando houve resposta de mais de um avaliador, foi considerada 
a categoria de menor qualidade, entre as indicadas.

---

## Evolução da Qualidade relativa - Mestrado
![plot of chunk QualiRelTimeM](assets/fig/QualiRelTimeM-1.png)

*** =pnotes

**Evolução da proporção de teses/dissertações defendidas entre
 2011 e 2015 em cada classe de qualidade.**

A avaliação anônima foi feita pelos participantes das bancas de defesa, 
que indicaram a qualidade do trabalho relativa a todos que 
já orientou ou avaliou, entre quatro classes:

- Abaixo dos 50% melhores que já avaliou/orientou
- Entre os 50% melhores
- Entre os 25% melhores
- Entre os 10% melhores

Quando houve resposta de mais de um avaliador, foi considerada 
a categoria de menor qualidade, entre as indicadas.

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
![plot of chunk ImpactoMD](assets/fig/ImpactoMD-1.png)

*** =pnotes

**Proporção de teses e dissertações defendidas entre  2011 e 2015 , 
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

## Evolução do Impacto potencial - Doutorado
![plot of chunk ImpactoTimeD](assets/fig/ImpactoTimeD-1.png)

*** =pnotes

** Evolução da proporção de teses e dissertações defendidas entre  2011 e 2015 , 
em cada classe de impacto.**

A avaliação anônima foi feita pelos participantes das bancas de defesa, 
que indicaram o impacto potencial da melhor publicação resultante da tese/dissertação, entre quatro classes:

- Há baixa chance de publicação 
- Impacto baixo 
- Impacto médio
- Impacto alto

Quando houve resposta de mais de um avaliador, foi considerada 
a categoria mais baixa entre as indicadas.

---

## Evolução do Impacto potencial - Mestrado
![plot of chunk ImpactoTimeM](assets/fig/ImpactoTimeM-1.png)

*** =pnotes

** Evolução da proporção de teses e dissertações defendidas entre  2011 e 2015 , 
em cada classe de impacto.**

A avaliação anônima foi feita pelos participantes das bancas de defesa, 
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
![plot of chunk DensityNotas](assets/fig/DensityNotas-1.png)

*** =pnotes

**Distribuição das notas das dissertações de mestrado e teses de doutorado 
defendidas no IBUSP  
( 2011 - 2015 ).**

A avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa: 
redação, contextualização teórica, objetivos bem definidos, pergunta/hipóteses claras, 
originalidade e relevância, métodos bem descritos e adequados, 
análises bem descritas e adequadas, 
resultados bem apresentados e conclusivos, discussão lógica e bem fundamentada, uso adequado da literatura.

As notas são as médias do número de indicações por tese/dissertação.
Quando houve avaliação por mais de um membro da banca usamos a menos nota.
As curvas são [kernels de densidade probabilística](http://en.wikipedia.org/wiki/Kernel_density_estimation), 
uma alternativa preferível a histogramas
para representar distribuições de frequência.


---

## Evolução das Notas - Doutorado
![plot of chunk NotasTimeD](assets/fig/NotasTimeD-1.png)

*** =pnotes

**Evolução das notas médias das dissertações de mestrado e teses de doutorado 
defendidas entre  2011 e 2015 .**

A avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa: 
redação, contextualização teórica, objetivos bem definidos, pergunta/hipóteses claras, 
originalidade e relevância, métodos bem descritos e adequados, 
análises bem descritas e adequadas, 
resultados bem apresentados e conclusivos, discussão lógica e bem fundamentada, uso adequado da literatura.

As notas são as médias do número de indicações por tese/dissertação.
Quando houve avaliação por mais de um membro da banca utilizamos a menos nota.


---

## Evolução das Notas - Mestrado
![plot of chunk NotasTimeM](assets/fig/NotasTimeM-1.png)

*** =pnotes

**Evolução das notas médias das dissertações de mestrado e teses de doutorado 
defendidas entre  2011 e 2015 .**

A avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa: 
redação, contextualização teórica, objetivos bem definidos, pergunta/hipóteses claras, 
originalidade e relevância, métodos bem descritos e adequados, 
análises bem descritas e adequadas, 
resultados bem apresentados e conclusivos, discussão lógica e bem fundamentada, uso adequado da literatura.

As notas são as médias do número de indicações por tese/dissertação.
Quando houve avaliação por mais de um membro da banca utilizamos a menos nota.


---

## Proporção de indicações por item
![plot of chunk DotplotMD](assets/fig/DotplotMD-1.png)

*** =pnotes

**Proporção de teses e dissertações consideradas excelentes em dez quesitos
( defesas entre 2011 e 2015 ).**

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

![plot of chunk DotplotExtratoM](assets/fig/DotplotExtratoM-1.png)
***=pnotes

**Proporção de teses e dissertações consideradas excelentes em dez quesitos: 
comparação entre os melhores trabalhos e os demais. 
(Defesas entres 2011 e 2015 )**

Avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa 
(detalhes nos slides anteriores).
Para o cálculo das proporções, primeiro foram obtidas as médias de indicações de excelência  
em cada quesito, por aluno. Em seguida foi calculada a média desses valores para dois grupos:

- **Primeiros quartis**: abaixo dos 25% melhores trabalhos já avaliados pelo membro da banca;
- **Último quartil**: entre os 25% ou 10% melhores trabalhos já avaliados pelo membro da banca.



---

## Quartis de qualidade (Doutorado)

![plot of chunk DotplotExtratoD](assets/fig/DotplotExtratoD-1.png)
***=pnotes

**Proporção de teses e dissertações consideradas excelentes em dez quesitos: 
comparação entre os melhores trabalhos e os demais. 
(Defesas entres 2011 e 2015 )**

Avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa 
(detalhes nos slides anteriores).
Para o cálculo das proporções, primeiro foram obtidas as médias de indicações de excelência  
em cada quesito, por aluno. Em seguida foi calculada a média desses valores para dois grupos:

- **Primeiros quartis**: abaixo dos 25% melhores trabalhos já avaliados pelo membro da banca;
- **Último quartil**: entre os 25% ou 10% melhores trabalhos já avaliados pelo membro da banca.



---

## Prazo de depósito e nota (Mestrado)
![plot of chunk TempoNotaM](assets/fig/TempoNotaM-1.png)
***=pnotes

**Notas das dissertações e teses 
defendidas entre 2011 e 2015, em função do tempo de conclusão.**

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
![plot of chunk TempoNotaD](assets/fig/TempoNotaD-1.png)
***=pnotes

**Notas das dissertações e teses 
defendidas entre 2011 e 2015, em função do tempo de conclusão.**

Avaliação anônima feita pelos participantes das bancas de defesa, 
que indicaram até dez aspectos em que a tese/dissertação foi excelente ou muito boa 
(itens detalhados nos slides anteriores).
As notas são as médias do número de indicações por tese/dissertação, de três grupos:

- Atrasado: tese/dissertação depositada após mais de 30 dias do prazo regimental.
- No prazo: depositada entre 30 dias após a 10 dias antes do prazo.
- Adiantado: depósito com antecedência de mais de 10 dias do prazo.

Os atrasos devem-se a prorrogações e trancamentos, que  
ultrapassam os prazos regimentais. 
