# PhoeniXML XQuery modules

XQuery 3.1 library modules for everyday work with JSON and XML. They are plain XQuery: they run
on the `xquery4` tool, the PhoenixmlDb XQuery engine and other XQuery 3.1 processors.

| Module | Namespace | File |
|---|---|---|
| JSON | `https://phoenixml.dev/modules/json` | [`modules/json.xqm`](modules/json.xqm) |
| XML | `https://phoenixml.dev/modules/xml` | [`modules/xml.xqm`](modules/xml.xqm) |

## Use

Import a module from a release tag. The URL of a tag does not change.

```xquery
import module namespace pj = "https://phoenixml.dev/modules/json"
  at "https://raw.githubusercontent.com/phoenixmldb/xquery-modules/v1.0.0/modules/json.xqm";

let $orders := pj:load(("data/a.json", "data/b.json"), static-base-uri())
return pj:select($orders, "items.*.name")
```

Or download the `.xqm` file and import it by a local path.

**Relative paths.** A relative path in a library module resolves against the module's location,
not against your query. The `load` functions therefore take your query's base URI as a second
argument: `pj:load($paths, static-base-uri())`. With one argument they take absolute URIs only, and
a relative path raises `pj:relative-uri` (or `px:relative-uri`).

**Resource policy.** A host that runs queries under a `ResourcePolicy` must allow the module URL
for import, and the data files for reading.

## JSON functions (`pj`)

| Function | Result |
|---|---|
| `pj:load($uris)` | Each JSON file, parsed. The URIs must be absolute. |
| `pj:load($paths, $base)` | Each JSON file, parsed. Paths resolve against `$base`. |
| `pj:select($json, $path)` | Values at a dotted path. A step is a key, `*` (all members or values), or an array position from 1: `"items.*.name"`, `"items.2.price"`. |
| `pj:records($json)` | All array members, with nested arrays flattened. |
| `pj:group-by($records, $key)` | A map from each value of field `$key` to an array of its records. |
| `pj:to-csv($records, $fields)` | CSV text with a header row. Values with a comma, quote or line break are quoted; maps and arrays are written as JSON. |
| `pj:to-xml($json)` | The W3C XML representation (`fn:json-to-xml`). |

```xquery
(: Items over 3, from two files, as CSV :)
let $items := pj:records(pj:load(("data/a.json", "data/b.json"), static-base-uri())?items)
return pj:to-csv($items[?price > 3], ("name", "price"))
```

## XML functions (`px`)

| Function | Result |
|---|---|
| `px:load($uris)` | Each XML document. The URIs must be absolute. |
| `px:load($paths, $base)` | Each XML document. Paths resolve against `$base`. |
| `px:to-json($element)` | A JSON-ready value: `"@name"` for attributes, the local name for child elements (an array when a name repeats), `"#text"` for text. An element with no attributes and no children gives its string value. |
| `px:to-csv($elements, $fields)` | CSV text with a header row. A field is a child element name or `@attribute`. |
| `px:strip-namespaces($node)` | A copy with local names only. |
| `px:path($node)` | A readable path, for example `/catalog[1]/product[2]/@id`. |
| `px:count-by($items, $key)` | A map from each key to its count. `$key` is a function. |

```xquery
(: Products by category, then the catalog as JSON :)
let $doc := px:load("catalog.xml", static-base-uri())
return (
  px:count-by($doc//product, function($p) { string($p/@category) }),
  serialize(px:to-json($doc/catalog), map { "method": "json" })
)
```

## Tests

```bash
dotnet tool install -g xquery4
./scripts/test.sh
```

Each `tests/<module>/<name>.xq` runs with the `xquery` tool, and its output must equal
`<name>.expected`. CI runs the tests on Linux and Windows with the `xquery4` version in
`XQUERY4_VERSION`.

## License

Apache License 2.0. See [LICENSE](LICENSE).
