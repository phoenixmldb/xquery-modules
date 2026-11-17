import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
let $j := pj:load("../data/a.json", static-base-uri()) return pj:find($j, "price")
