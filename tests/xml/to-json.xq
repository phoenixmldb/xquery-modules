import module namespace px = "https://phoenixml.dev/modules/xml" at "../../modules/xml.xqm";
serialize(px:to-json(px:load("../data/catalog.xml", static-base-uri())//product[2]), map{"method":"json"})
