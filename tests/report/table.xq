import module namespace pr = "https://phoenixml.dev/modules/report" at "../../modules/report.xqm";
pr:table((map{"name":"pen","price":2.5}, map{"name":"pad, ruled","price":4}), ("name","price"))
