let $doc := html:parse(fetch:binary('https://www.worldometers.info/coronavirus/'))
let $cells := $doc//table[@id="main_table_countries_today"]/tbody/tr
for $cell in $cells
return

<datarow>
<country>{data($cell/td[1])}</country>
<map>
{switch(normalize-space($cell/td[1]))
case "World" return "https://vemaps.com/uploads/img/large/wrld-15.jpg"
case "China" return "https://vemaps.com/uploads/img/large/cn-03.jpg"
case "Italy" return "https://vemaps.com/uploads/img/large/it-04.jpg"
case "Iran" return "https://vemaps.com/uploads/img/large/ir-03.jpg"
case "Turkey" return "https://vemaps.com/uploads/img/large/tr-03.jpg"
case "Spain" return "https://vemaps.com/uploads/img/large/es-03.jpg"
case "Germany" return "https://vemaps.com/uploads/img/large/de-03.jpg"
case "France" return "https://vemaps.com/uploads/img/large/fr-03.jpg"
case "USA" return "https://vemaps.com/uploads/img/large/us-03.jpg"
case "Japan" return "https://vemaps.com/uploads/img/large/jp-03.jpg"
case "Netherlands" return "https://vemaps.com/uploads/img/large/nl-03.jpg"
case "Belgium" return "https://vemaps.com/uploads/img/large/be-03.jpg"
case "UK" return "https://vemaps.com/uploads/img/large/gb-03.jpg"
case "Switzerland" return "https://vemaps.com/uploads/img/large/ch-03.jpg"
default return "https://vemaps.com/uploads/img/large/wrld-15.jpg"}
</map>
<totalcases>{data($cell/td[2])}</totalcases>
<newcases>{data($cell/td[3])}</newcases>
<totaldeaths>{data($cell/td[4])}</totaldeaths>
<newdeaths>{data($cell/td[5])}</newdeaths>
<totalrecovered>{data($cell/td[6])}</totalrecovered>
</datarow>
