import module namespace pf = "https://phoenixml.dev/modules/files" at "../../modules/files.xqm";
string-join(pf:xml("../data/folder", static-base-uri()) ! (*/@n || " " || (base-uri(.) ! replace(., '^.*/folder/', ''))), "
")
