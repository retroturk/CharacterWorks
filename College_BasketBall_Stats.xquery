(: a simple xquery to pull college basketball player stat's from ESPN web page :)
(: XML Path/URL must be http://rss.cnn.com/rss/edition.rss or any working RSS :)

let $team_number :=2619
let $logo:= concat("https://a.espncdn.com/i/teamlogos/ncaa/500/",$team_number,".png")

let $doc := html:parse(fetch:binary(concat("https://www.espn.com/mens-college-basketball/team/stats/_/id/", $team_number)))
let $cellsname := $doc//tr[@class='Table__TR Table__TR--sm Table__even']
let $docpic := html:parse(fetch:binary(concat("https://www.espn.com/mens-college-basketball/team/roster/_/id/", $team_number)))
let $cells := $docpic//tr[@class='Table__TR Table__TR--lg Table__even']
for $cell at $pos in (1 to 16)
for $y in $cells
where $cellsname[$pos]/td/span/a/text() = $y/td[2]/div/a/text()
return  <datarow>

<logo>{data($logo)}</logo>
<team_name1>{data($doc//span[@class="db pr3 nowrap fw-bold"])} </team_name1>
<team_name2>{data($doc//span[@class="db"])} </team_name2> 
<picture>{data($y/td/div/div/figure/div/img/@alt)}</picture>

<name>{substring-before(data($cellsname[$pos]/td/span/a/text()), ' ')}</name>
<surname>{substring-after(data($cellsname[$pos]/td/span/a/text()), ' ')}</surname>
<number>{data($y/td[2]/div/span[@class='pl2 n10'])}</number> 

<gp>{data($cellsname[$pos+15]/td[1]/span) }</gp>
<min>{data($cellsname[$pos+15]/td[2]/span)}</min>
<pts>{data($cellsname[$pos+15]/td[3]/span)}</pts>
<reb>{data($cellsname[$pos+15]/td[4]/span)}</reb>
<ast>{data($cellsname[$pos+15]/td[5]/span)}</ast>
<stl>{data($cellsname[$pos+15]/td[6]/span)}</stl>
<blk>{data($cellsname[$pos+15]/td[7]/span)}</blk>
<to>{data($cellsname[$pos+15]/td[8]/span)}</to>
<fg>{data($cellsname[$pos+15]/td[9]/span)}</fg>
<ft>{data($cellsname[$pos+15]/td[10]/span)}</ft>
<p3p>{data($cellsname[$pos+15]/td[11]/span)}</p3p>
<smin>{data($cellsname[$pos+45]/td[1]/span) }     </smin>
<sfgm>{data($cellsname[$pos+45]/td[2]/span) }    </sfgm>
<sfga>{data($cellsname[$pos+45]/td[3]/span) }     </sfga>
<sftm>{data($cellsname[$pos+45]/td[4]/span) }    </sftm>
<sfta>{data($cellsname[$pos+45]/td[5]/span) }    </sfta>
<s3pm>{data($cellsname[$pos+45]/td[6]/span) }      </s3pm>
<s3pa> {data($cellsname[$pos+45]/td[7]/span) }      </s3pa>
<spts>{data($cellsname[$pos+45]/td[8]/span) }       </spts>
<sor> {data($cellsname[$pos+45]/td[9]/span) }        </sor>
<sdr> {data($cellsname[$pos+45]/td[10]/span) }       </sdr>
<sreb> {data($cellsname[$pos+45]/td[11]/span) }      </sreb>
<sast> {data($cellsname[$pos+45]/td[12]/span) }        </sast>
<sto> {data($cellsname[$pos+45]/td[13]/span) }         </sto>
<sstl> {data($cellsname[$pos+45]/td[14]/span) }          </sstl>
<sblk> {data($cellsname[$pos+45]/td[15]/span) }         </sblk>
</datarow>
