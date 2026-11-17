import module namespace pr = "https://phoenixml.dev/modules/report" at "../../modules/report.xqm";
let $s := pr:stats((2.5, "7", "x", 4))
return for $k in ("count","sum","min","max","avg") return $k || "=" || string($s($k))
