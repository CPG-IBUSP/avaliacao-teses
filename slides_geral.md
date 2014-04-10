---

title       : Avaliação das tese e dissertações do IB-USP
subtitle    : Dados agregados de todos os programas
author      : Comissão de Pós-Graduação
job         : Instituto de Biociências da Universidade de São Paulo
framework   : deckjs        # {deckjs, io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light      # 
widgets     : [bootstrap, quiz, shiny, interactive]# {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
github:
  user: CPG-IBUSP
  repo: avaliacao-teses
 
---






## RESULTADOS AGREGADOS:

### Análises da ficha de avaliação de teses e dissertações, dados agregados de todos os programas do IB-USP.

#### Links
 - Para menu de slides pressione 'm'
 - [Página principal](index.html)
 - Resultados por programa:
   - [Botânica](slides_botanica.html)
   - [Ecologia](slides_ecologia.html)
   - [Fisiologia](slides_fisiologia.html)
   - [Genética](slides_genetica.html)
   - [Zoologia](slides_zoologia.html)

---

## Tamanho da amostra
### Defesas entre 2011 e 2013
<!-- Table generated in R 3.0.3 by googleVis 0.4.7 package -->
<!-- Thu Apr 10 02:51:40 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTableID3ca0473ff4fc () {
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
function drawChartTableID3ca0473ff4fc() {
var data = gvisDataTableID3ca0473ff4fc();
var options = {};
options["allowHtml"] = true;
options["width"] = "60%";
options["sort"] = "disable";

    var chart = new google.visualization.Table(
    document.getElementById('TableID3ca0473ff4fc')
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
callbacks.push(drawChartTableID3ca0473ff4fc);
})();
function displayChartTableID3ca0473ff4fc() {
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
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTableID3ca0473ff4fc"></script>
 
<!-- divChart -->
  
<div id="TableID3ca0473ff4fc"
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

---

## Qualidade relativa - Doutorado
![plot of chunk QualiRelD](assets/fig/QualiRelD.png) 


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

---

## Proporção de indicações por item
![plot of chunk DotplotMD](assets/fig/DotplotMD.png) 

---

## Quartis de qualidade (Mestrado)

![plot of chunk DotplotExtratoM](assets/fig/DotplotExtratoM.png) 

---

## Quartis de qualidade (Doutorado)

![plot of chunk DotplotExtratoD](assets/fig/DotplotExtratoD.png) 


---

## Prazo de depósito e nota (Mestrado)
![plot of chunk TempoNotaM](assets/fig/TempoNotaM.png) 


---

## Prazo de depósito e nota (Doutorado)
![plot of chunk TempoNotaD](assets/fig/TempoNotaD.png) 

