import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
try { pj:load("data/a.json") } catch * { local-name-from-QName($err:code) }
