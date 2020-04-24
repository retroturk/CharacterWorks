let $doc := html:parse(fetch:binary('https://www.bloomberght.com/'))
let $cells := $doc//div[@id='HeaderMarkets']/ul/li
for $cell in $cells
return

<datarow>
<label>{data($cell/a/span/small[1])}</label>
<value>{data($cell/a/span/small[2])}</value>
<change>{data($cell/a/span/small[3])}</change>
<sign>
{switch(normalize-space($cell/a/i/@class))
case "data-icon up" return "▲"
case "data-icon down" return "▼"
default return "▪"}
</sign>
</datarow>
