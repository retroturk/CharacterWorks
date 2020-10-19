(:Süper Lig 2020-2021 Sezonu Puan Cetveli:)

let $doc :=html:parse(convert:binary-to-string(fetch:binary('https://www.tff.org/default.aspx?pageID=198'), "windows-1254"),map { 'encoding': "UTF-8" })
let $cells := $doc//div[@id='ctl00_MPane_m_198_1890_ctnr_m_198_1890_Panel1']/table/tr
for $cell in $cells
return

<datarow>
<Takimadi>{data($cell/td[1])}</Takimadi>
<Oynanan>{data($cell/td[2])}</Oynanan>
<Galibiyet>{data($cell/td[3])}</Galibiyet>
<Beraberlik>{data($cell/td[4])}</Beraberlik>
<Maglubiyet>{data($cell/td[5])}</Maglubiyet>
<Atilan>{data($cell/td[6])}</Atilan>
<Yenen>{data($cell/td[7])}</Yenen>
<Averaj>{data($cell/td[8])}</Averaj>
<Puan>{data($cell/td[9])}</Puan>
</datarow>
