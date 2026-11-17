import module namespace pc = "https://phoenixml.dev/modules/csv" at "../../modules/csv.xqm";
let $r := pc:load("../data/items.csv", static-base-uri())
return ($r ! ?name, $r[?name eq "ink"]?note, count($r))
