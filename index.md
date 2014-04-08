---
title       : Avaliação das tese e dissertações do IB-USP
subtitle    : 
author      : Comissão de Pós-Graduação
job         : Instituto de Biociências da Universidade de São Paulo
framework   : deckjs        # {deckjs, io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : solarized_light      # 
widgets     : [bootstrap, quiz, shiny, interactive]# {mathjax, quiz, bootstrap}
# ext_widgets: {rCharts: ["libraries/rickshaw", "libraries/highcharts", "libraries/nvd3", "libraries/morris"]}
mode        : selfcontained # {standalone, draft}
github:
  user: CPG-IBUSP
  repo: avaliacao-teses
---

## Apresentação


---

## Metodologia
> - Ficha preenchida pela banca examinadora
> - Respostas anônimas
> - Três perguntas:
>   - Qualidade relativa às teses que avaliou/orientou
>   - Impacto potencial do melhor artigo
>   - Excelência em 10 quesitos

---

## Tamanho da amostra
### Defesas entre 2011 e 2013
<!-- Table generated in R 3.0.3 by googleVis 0.4.7 package -->
<!-- Tue Apr  8 02:09:32 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataTableID37a679e802bc () {
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
function drawChartTableID37a679e802bc() {
var data = gvisDataTableID37a679e802bc();
var options = {};
options["allowHtml"] = true;
options["width"] = "60%";
options["sort"] = "disable";

    var chart = new google.visualization.Table(
    document.getElementById('TableID37a679e802bc')
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
callbacks.push(drawChartTableID37a679e802bc);
})();
function displayChartTableID37a679e802bc() {
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
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartTableID37a679e802bc"></script>
 
<!-- divChart -->
  
<div id="TableID37a679e802bc"
  style="width: 60%px; height: 500px;">
</div>

---
## Qualidade relativa - Mestrado
![plot of chunk QRM](assets/fig/QRM.png) 

---

## Qualidade relativa - Doutorado
![plot of chunk QRD](assets/fig/QRD.png) 


---
## Planilha de dados

- Download em formato [RData](./files/ficha.RData) (para R)
- Download em formato [csv](./files/ficha_avaliacao_CPG_IB.csv) (planilhas eletrônicas)
- [Metadados](./files/metadata.html)
