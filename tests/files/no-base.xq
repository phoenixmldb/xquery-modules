import module namespace pf = "https://phoenixml.dev/modules/files" at "../../modules/files.xqm";
count(pf:xml(resolve-uri("../data/folder/", static-base-uri()), ()))
