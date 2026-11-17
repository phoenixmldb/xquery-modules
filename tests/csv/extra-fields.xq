import module namespace pc = "https://phoenixml.dev/modules/csv" at "../../modules/csv.xqm";
try { pc:parse("a,b&#10;1,2,3") } catch * { local-name-from-QName($err:code) }
