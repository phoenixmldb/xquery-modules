import module namespace pf = "https://phoenixml.dev/modules/files" at "../../modules/files.xqm";
string-join(pf:json("../data/folder", static-base-uri()) ! (?uri ! replace(., '^.*/folder/', '') || " " || serialize(?json, map{"method":"json"})), "
")
