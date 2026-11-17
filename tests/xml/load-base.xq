import module namespace px = "https://phoenixml.dev/modules/xml" at "../../modules/xml.xqm";
count(px:load("../data/catalog.xml", static-base-uri())//product)
