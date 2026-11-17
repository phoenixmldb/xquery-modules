import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
pj:records([[1,[2,3]],4]) => string-join(",")
