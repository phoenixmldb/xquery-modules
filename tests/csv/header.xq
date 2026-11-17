import module namespace pc = "https://phoenixml.dev/modules/csv" at "../../modules/csv.xqm";
pc:header(unparsed-text(resolve-uri("../data/items.csv", static-base-uri())))
