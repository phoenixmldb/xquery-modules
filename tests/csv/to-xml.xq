import module namespace pc = "https://phoenixml.dev/modules/csv" at "../../modules/csv.xqm";
let $t := unparsed-text(resolve-uri("../data/items.csv", static-base-uri()))
return serialize(pc:to-xml(pc:parse($t)[1], (pc:header($t), "unit price")))
