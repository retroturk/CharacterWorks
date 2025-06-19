(: Cryptocurrency Prices by Market Cap :)

let $doc := html:parse(fetch:binary('https://coinmarketcap.com/'))
let $cells := $doc//div[@class='main-content']//table/tbody/tr
for $cell at $pos in $cells
where $pos <11
return


<datarow>
<icon>{data($cell/td[3]//img[@class='coin-logo']/@src)}</icon>
<crypto>{data($cell/td[3]/div/div/div/p)}</crypto>
<symbol>{data($cell/td[3]/div/div/div/div/p)}</symbol>
<price>{data($cell/td[4]/div)}</price>
<sign>{substring-after(data($cell/td[5]/span/span/@class), 'icon-Caret-')}</sign>
<percentage>{substring-before(data($cell/td[5]), '%')}</percentage>
<chart>{data($cell/td[11]/img/@src)}</chart>
</datarow>
