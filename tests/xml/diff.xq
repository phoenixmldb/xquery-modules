import module namespace px = "https://phoenixml.dev/modules/xml" at "../../modules/xml.xqm";
let $a := px:load("../data/catalog.xml", static-base-uri())
let $b := document { <catalog><product id="p1" category="tools"><name>Hammer</name><price>13</price></product><product id="p2"/></catalog> }
return (px:diff($a, $a), "--", px:diff($a, $b))
