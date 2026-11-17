import module namespace pj = "https://phoenixml.dev/modules/json" at "../../modules/json.xqm";
pj:to-xml(map{"a":[1,"x"]})/*:map/*:array/*:number/string()
