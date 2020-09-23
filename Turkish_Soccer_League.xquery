(:Süper Lig 2020-2021 Sezonu Puan Cetveli:)

let $doc := html:parse(fetch:binary('https://www.tff.org/default.aspx?pageID=198'))
let $cells := $doc//div[@id='ctl00_MPane_m_198_1890_ctnr_m_198_1890_Panel1']/table/tr
for $cell in $cells
return

<datarow>
<sira>{substring-before(data($cell/td[1]), '.')}</sira>
<takimadi>{substring-after(data($cell/td[1]), '.')}</takimadi>
<Oynanan>{data($cell/td[2])}</Oynanan>
<Galibiyet>{data($cell/td[3])}</Galibiyet>
<Beraberlik>{data($cell/td[4])}</Beraberlik>
<Maglubiyet>{data($cell/td[5])}</Maglubiyet>
<Atilan>{data($cell/td[6])}</Atilan>
<Yenen>{data($cell/td[7])}</Yenen>
<Averaj>{data($cell/td[8])}</Averaj>
<Puan>{data($cell/td[9])}</Puan>
</datarow>
