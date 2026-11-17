import module namespace px = "https://phoenixml.dev/modules/xml" at "../../modules/xml.xqm";
px:to-csv(px:load("../data/catalog.xml", static-base-uri())//product, ("@id","name","price","tag"))
