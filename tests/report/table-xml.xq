import module namespace pr = "https://phoenixml.dev/modules/report" at "../../modules/report.xqm";
pr:table(doc(resolve-uri("../data/catalog.xml", static-base-uri()))//product, ("@id","name","price"))
