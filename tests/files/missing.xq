import module namespace pf = "https://phoenixml.dev/modules/files" at "../../modules/files.xqm";
try { pf:list("../data/nosuch", static-base-uri(), "*", true()) } catch * { $err:code }
