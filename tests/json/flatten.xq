import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
let $f := pj:flatten(pj:load("../data/a.json", static-base-uri()))
for $k in sort(map:keys($f)) return $k || "=" || string-join($f($k) ! string(.), "")
