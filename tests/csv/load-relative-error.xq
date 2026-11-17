import module namespace pc = "https://phoenixml.dev/modules/csv" at "../../modules/csv.xqm";
try { pc:load("x.csv") } catch * { local-name-from-QName($err:code) }
