(: Cryptocurrency Prices by Market Cap :)

let $doc := html:parse(fetch:binary('https://coinmarketcap.com/'))
let $cells := $doc//div[@class='tableWrapper___3utdq']/table/tbody/tr
for $cell at $pos in $cells
where $pos <11
return

<datarow>
<icon>{data($cell/td[3]/div/img/@src)}</icon>
<label>{data($cell/td[3]/div/div/p)}</label>
<symbol>{data($cell/td[3]/div/div/div/p)}</symbol>
<price>{data($cell/td[4]/div/a)}</price>
<sign>{substring-after(data($cell/td[5]/span/span/@class), 'icon-Caret-')}</sign>
<percentage>{data($cell/td[5])}</percentage>
</datarow>
