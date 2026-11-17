import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
let $r := pj:load(("../data/a.json","../data/b.json"), static-base-uri())?items?*
return (pj:pick($r, ("name","nope")) ! serialize(., map{"method":"json"}))
