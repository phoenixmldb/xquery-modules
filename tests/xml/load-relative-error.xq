import module namespace px = "https://phoenixml.dev/modules/xml" at "../../modules/xml.xqm";
try { px:load("data/catalog.xml") } catch * { local-name-from-QName($err:code) }
