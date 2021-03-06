(: a simple xquery to pull  college basketball team roster from ESPN web page :)
(: XML Path/URL must be http://rss.cnn.com/rss/edition.rss or any working RSS :)

let $team_number :=2619
let $logo:= concat("https://a.espncdn.com/i/teamlogos/ncaa/500/",$team_number,".png")
let $doc := html:parse(fetch:binary(concat("https://www.espn.com/mens-college-basketball/team/roster/_/id/", $team_number)))
let $cells := $doc//tr[@class='Table__TR Table__TR--lg Table__even']
for $cell in $cells
return

<datarow>
<logo>{data($logo)}</logo>
<team_name1>{data($doc//span[@class="db pr3 nowrap fw-bold"])} </team_name1>
<team_name2>{data($doc//span[@class="db"])} </team_name2> 
<picture>{data($cell/td/div/div/figure/div/img/@alt)}</picture>
<name>{substring-before(data($cell/td[2]/div/a/text()), ' ')}</name>
<surname>{substring-after(data($cell/td[2]/div/a/text()), ' ')}</surname> 
<number>{data($cell/td[2]/div/span[@class='pl2 n10'])}</number>
<pos>{data($cell/td[3]/div)}   </pos>
<ht>{data($cell/td[4]/div)}   </ht>
<wt>{data($cell/td[5]/div)}  </wt>
<class>{data($cell/td[6]/div)}   </class>
<hometawn>{data($cell/td[7]/div)} </hometawn>
</datarow>

 
