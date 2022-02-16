(: Concacaf W Standings :)

let $doc := html:parse(fetch:binary("https://concacaf.datafactory.la/en/claseliminatoriasfem/standings.html"))
let $cells := $doc//table[@class='competition-group-char-table table table-hover']/tr
for $cell in $cells
return
<datarow>
<crests>{switch($cell/td[3])
case "Anguilla" return "AIA.png"
case "Suriname" return "SUR.png"
case "Puerto Rico" return "PUR.png"
case "Barbuda" return "ATG.png"
case "Mexico" return "MEX.png"

case "Curaçao" return "CUW.png"
case "St. Kitts &amp; Nevis" return "SKN.png"
case "Virgin Is." return "VIR.png"
case "Guatemala" return "GUA.png"
case "Costa Rica" return "CRC.png"

case "Grenada" return "GRN.png"
case "Dominican Rep." return "DOM.png"
case "Jamaica" return "JAM.png"
case "Bermuda" return "BER.png"
case "Cayman Islands" return "CAY.png"

case "El Salvador" return "DOM.png"
case "Panama" return "PAN.png"
case "Barbados" return "BRB.png"
case "Aruba" return "ARU.png"
case "Belize" return "BLZ.png"

case "Honduras" return "HON.png"
case "Cuba" return "CUB.png"
case "Saint Vincent" return "VIN.png"
case "Haiti" return "HAI.png"
case "British V. I." return "VGB.png"


case "Nicaragua" return "NCA.png"
case "Turcas y caicos" return "TCA.png"
case "Dominica" return "DMA.png"
case "Guyana" return "GUY.png"
case "Trinidad" return "TRI.png"


default return data($cell/td[3])}
</crests> 
<TeamName>{data($cell/td[3])}</TeamName>
<Win>{data($cell/td[4])}</Win>
<Draw>{data($cell/td[5])}</Draw>
<Lost>{data($cell/td[5])}</Lost>
<GoalD>{data($cell/td[8])}</GoalD>
<Points>{data($cell/td[8])}</Points>
</datarow>
