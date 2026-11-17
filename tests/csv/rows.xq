import module namespace pc = "https://phoenixml.dev/modules/csv" at "../../modules/csv.xqm";
pc:rows("a,,b&#10;,x,&#10;&#10;&quot;q,1&quot;") ! serialize(., map{"method":"json"})
