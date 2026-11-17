import module namespace px = "https://phoenixml.dev/modules/xml" at "../../modules/xml.xqm";
let $d := px:load("../data/catalog.xml", static-base-uri()) return (px:path($d), px:path($d//product[2]/@id), px:path($d//product[2]/tag[2]), px:path($d//product[2]/tag[2]/text()))
