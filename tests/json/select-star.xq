import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
pj:select(pj:load(("../data/a.json","../data/b.json"), static-base-uri()), "items.*.name")
