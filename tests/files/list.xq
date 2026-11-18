import module namespace pf = "https://phoenixml.dev/modules/files" at "../../modules/files.xqm";
string-join(pf:list("../data/folder", static-base-uri(), "*", true()) ! replace(., '^.*/folder/', ''), " ")
