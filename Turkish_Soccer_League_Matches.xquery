(: Türkiye Süper liginde haftanın Maçları :)
(: Logolar ve tüm bilgiler TFF sitesinden alınmaktadır :)

let $doc :=html:parse(convert:binary-to-string(fetch:binary('https://www.tff.org/default.aspx?pageID=600'), "windows-1254"),map { 'encoding': "UTF-8" })
let $superlig := $doc//table[@class="TFFTable"]/tr
for $att at $pos in $superlig
where $pos mod 2 = 0 and $pos <22
return  <datarow>
<tarih>{data($superlig[$pos]/td/center/Label[1]/text())}        </tarih>
<gun>{data($superlig[$pos]/td/center/Label[2]/text())}        </gun>
<saat>{data($superlig[$pos]/td/center/div/div/span)}          </saat>
<homelogo>{data($superlig[$pos]/td[2]/img/@src)}     </homelogo>
<home>{data($superlig[$pos]/td[2]/a/b/font)}     </home>
<visitorlogo>{data($superlig[$pos]/td[4]/img/@src)}    </visitorlogo>
<visitor>{data($superlig[$pos]/td[4]/a/b/font)}     </visitor>
</datarow>
