let $doc := html:parse(fetch:binary('https://www.bloomberght.com/doviz'))
let $cells := $doc//tbody/tr
for $cell in $cells
return

<datarow>
<label>{data($cell/td[1]/div[2]/div[1])}</label>
<value>{data($cell/td[2])}</value>
<change>{data($cell/td[3])}</change>
<sign>
{switch(normalize-space($cell/td[2]/span[2]/@class))
case "setIcon setTextColor bloomberght-icon-font-graphic-up text-green-700" return "▲"
case "setIcon setTextColor bloomberght-icon-font-graphic-down text-red-700" return "▼"
default return "▪"}
</sign>
</datarow>

