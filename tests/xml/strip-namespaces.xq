import module namespace px = "https://phoenixml.dev/modules/xml" at "../../modules/xml.xqm";
let $s := px:strip-namespaces(<a:r xmlns:a="urn:a" a:k="v"><a:c/></a:r>) return (name($s), namespace-uri($s), name($s/@*), name($s/*))
