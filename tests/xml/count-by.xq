import module namespace px = "https://phoenixml.dev/modules/xml" at "../../modules/xml.xqm";
let $m := px:count-by(px:load("../data/catalog.xml", static-base-uri())//product, function($p) { string($p/@category) }) return ($m("tools"), $m("paint"), map:size($m))
