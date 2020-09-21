(: https://covid19.saglik.gov.tr/ sitesinde yer alan covid-19 günlük istatistikleri almak icin XQuery kodu :)

let $doc := html:parse(fetch:binary("https://covid19.saglik.gov.tr/"))
let $cells := $doc//script[@type='text/javascript']
let $jso :=substring-before(substring($cells[9],32),';')
let $json_sonuc := json:parse($jso)

return $json_sonuc//_ 


