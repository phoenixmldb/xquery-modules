import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
let $g := pj:group-by(pj:records(pj:load(("../data/a.json","../data/b.json"), static-base-uri())?items), "name") return (map:size($g), array:size($g("pen")), sort(map:keys($g)))
