<?xml version="1.0" encoding="UTF-8"?>
<!--
  Converts one JSON file to readable XML.
    xslt -it main json-to-xml.xsl -p href="file://$PWD/data.json" -p root=data
  href is a URI: a relative href, or a path without file://, resolves against this
  stylesheet's location, so give a file:// URI (on Windows, file:///C:/data/file).
  Licensed under the Apache License, Version 2.0.
-->
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:jx="https://phoenixml.dev/modules/xslt/json"
    exclude-result-prefixes="#all">
  <xsl:import href="json.xsl"/>
  <xsl:param name="href" as="xs:string" required="yes"/>
  <xsl:param name="root" as="xs:string" select="'json'"/>
  <xsl:output method="xml" indent="yes"/>
  <xsl:template name="main">
    <xsl:sequence select="jx:to-xml(unparsed-text(resolve-uri($href)), $root)"/>
  </xsl:template>
</xsl:stylesheet>
