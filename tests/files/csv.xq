import module namespace pf = "https://phoenixml.dev/modules/files" at "../../modules/files.xqm";
string-join(pf:csv("../data/folder", static-base-uri()) ! (?id || " " || ?name || " " || (?("#uri") ! replace(., '^.*/folder/', ''))), "
")
