let $doc := html:parse(fetch:binary('https://www.espn.com/mens-college-basketball/matchup?gameId=401265069'))
let $cells := $doc//article[@id='teamstats-wrap']/div/table/tbody/tr
for $cell in $cells
return
<datarow>
<stats-attr>{data($cell/td[1])}</stats-attr>
<stats-away>{data($cell/td[2])}</stats-away>
<stats-home>{data($cell/td[3])}</stats-home>
</datarow>
