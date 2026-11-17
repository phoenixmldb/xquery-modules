import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
pj:select(pj:load("../data/a.json", static-base-uri()), "items.2.price"), pj:select(pj:load("../data/a.json", static-base-uri()), "items.9.price") => count()
