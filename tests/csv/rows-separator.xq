import module namespace pc = "https://phoenixml.dev/modules/csv" at "../../modules/csv.xqm";
pc:rows("a;b&#10;1;&quot;2;3&quot;", ";") ! serialize(., map{"method":"json"})
