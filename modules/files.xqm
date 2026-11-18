xquery version "3.1";

(:~
 : Load every JSON, XML or CSV file in a folder.
 :
 : The functions use directory collections:
 :   uri-collection("file:///data/?select=*.json;recurse=yes")
 : The PhoenixmlDb XQuery engine supports them from version 3.2.0, and Saxon
 : supports the same form. A host with a ResourcePolicy must allow the folder.
 :
 : Relative paths: a relative folder in a library module resolves against the
 : module's own location, not against your query. Give the functions your base URI:
 :   pf:json("data/", static-base-uri())
 :
 : Licensed under the Apache License, Version 2.0.
 :)
module namespace pf = "https://phoenixml.dev/modules/files";

import module namespace pc = "https://phoenixml.dev/modules/csv" at "csv.xqm";

declare namespace map = "http://www.w3.org/2005/xpath-functions/map";

(:~
 : The URIs of the files in folder $dir (resolved against $base) whose names
 : match $glob ("*" any characters, "?" one character), in name order.
 : $recurse true() includes subfolders.
 :)
declare function pf:list($dir as xs:string, $base as xs:string?, $glob as xs:string,
                         $recurse as xs:boolean) as xs:string* {
  let $uri := if (exists($base)) then resolve-uri($dir, $base) else resolve-uri($dir)
  let $folder := replace($uri, '([^/])$', '$1/')
  for $u in uri-collection($folder || '?select=' || $glob || ';recurse=' ||
                           (if ($recurse) then 'yes' else 'no'))
  order by string($u)
  return string($u)
};

(:~
 : Each JSON file in the folder (subfolders included), as
 : map { "uri": the file URI, "json": the parsed JSON }.
 :)
declare function pf:json($dir as xs:string, $base as xs:string?) as map(*)* {
  pf:json($dir, $base, '*.json', true())
};

declare function pf:json($dir as xs:string, $base as xs:string?, $glob as xs:string,
                         $recurse as xs:boolean) as map(*)* {
  for $u in pf:list($dir, $base, $glob, $recurse)
  return map { 'uri': $u, 'json': json-doc($u) }
};

(:~ Each XML file in the folder (subfolders included). base-uri() gives its file. :)
declare function pf:xml($dir as xs:string, $base as xs:string?) as document-node()* {
  pf:xml($dir, $base, '*.xml', true())
};

declare function pf:xml($dir as xs:string, $base as xs:string?, $glob as xs:string,
                        $recurse as xs:boolean) as document-node()* {
  pf:list($dir, $base, $glob, $recurse) ! doc(.)
};

(:~
 : The records of each CSV file with a header row in the folder (subfolders
 : included). Each record has an extra field "#uri" with its file URI.
 :)
declare function pf:csv($dir as xs:string, $base as xs:string?) as map(*)* {
  pf:csv($dir, $base, '*.csv', true())
};

declare function pf:csv($dir as xs:string, $base as xs:string?, $glob as xs:string,
                        $recurse as xs:boolean) as map(*)* {
  for $u in pf:list($dir, $base, $glob, $recurse)
  for $r in pc:load($u)
  return map:put($r, '#uri', $u)
};
