let $doc := html:parse(fetch:binary('https://www.worldometers.info/coronavirus/'))
let $cells := $doc//table[@id="main_table_countries_today"]/tbody/tr
for $cell in $cells
return

<datarow>
<country>{data($cell/td[1])}</country>
<flag>
{switch(normalize-space($cell/td[1]))
case "China" return "China.jpg"
case "Italy" return "Italy.jpg"
case "Iran" return "Iran.jpg"
case "S. Korea" return "South-Korea.jpg"
case "Spain" return "Spain.jpg"
case "Germany" return "Germany.jpg"
case "France" return "France.jpg"
case "USA" return "US.jpg"
case "Japan" return "Japan.jpg"
case "Netherlands" return "Netherlands.jpg"
case "Belgium" return "Belgium.jpg"
case "UK" return "UK.jpg"
case "Switzerland" return "Switzerland.jpg"
case "Austria" return "Austria.jpg"
case "Norway" return "Norway.jpg"
case "Sweden" return "Sweden.jpg"
case "Denmark" return "Denmark.jpg"
case "Malaysia" return "Malaysia.jpg"
case "Canada" return "Canada.jpg"

default return "default.jpg"}

</flag>
<totalcases>{data($cell/td[2])}</totalcases>
<newcases>{data($cell/td[3])}</newcases>
<totaldeaths>{data($cell/td[4])}</totaldeaths>
<newdeaths>{data($cell/td[5])}</newdeaths>
<totalrecovered>{data($cell/td[6])}</totalrecovered>
</datarow>
