let $doc := html:parse(fetch:binary('https://www.espn.com/mens-college-basketball/boxscore?gameId=401263309'))
let $cells:=$doc//table[@class='mod-data']/tbody/tr
for $cell in $cells
return 
<datarow>
<Name>{data($cell/td[1]/a/span[1])}</Name>
<Position>{data($cell/td[1]/span)}</Position>
<Min>{data($cell/td[2])}</Min>
<FG>{data($cell/td[3])}</FG>
<PT3>{data($cell/td[4])}</PT3>
<FT>{data($cell/td[5])}</FT>
<OREB>{data($cell/td[6])}</OREB>
<DREB>{data($cell/td[7])}</DREB>
<REB>{data($cell/td[8])}</REB>
<AST>{data($cell/td[9])}</AST>
<STL>{data($cell/td[10])}</STL>
<BLK>{data($cell/td[11])}</BLK>
<TO>{data($cell/td[12])}</TO>
<PF>{data($cell/td[13])}</PF>
<PTS>{data($cell/td[14])}</PTS>
</datarow>
