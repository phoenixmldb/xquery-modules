import module namespace pc = "https://phoenixml.dev/modules/csv" at "../../modules/csv.xqm";
try { pc:rows("a,b&quot;c,d") } catch * { local-name-from-QName($err:code) }
