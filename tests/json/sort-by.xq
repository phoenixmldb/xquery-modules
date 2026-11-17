import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
let $r := pj:load(("../data/a.json","../data/b.json"), static-base-uri())?items?*
return (string-join(pj:sort-by($r, "price") ! ?name, ","), string-join(pj:sort-by($r, "price", true()) ! ?name, ","))
