let $doc := html:parse(fetch:binary('https://www.worldometers.info/coronavirus/'))
let $cells := $doc//table[@id='main_table_countries_today']/tbody/tr
for $cell in $cells
return

<datarow>
<country>{data($cell/td[1])}</country>
<totalCases>{data($cell/td[2])}</totalCases>
<NewCases>{data($cell/td[3])}</NewCases>
<TotalDeath>{data($cell/td[4])}</TotalDeath>
<NewDeath>{data($cell/td[5])}</NewDeath>
<recovered>{data($cell/td[6])}</recovered>
</datarow>
