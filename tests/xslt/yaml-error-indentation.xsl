<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    xmlns:yx="https://phoenixml.dev/modules/xslt/yaml" exclude-result-prefixes="#all">
  <xsl:import href="../../xslt/yaml.xsl"/>
  <xsl:output method="text"/>
  <xsl:template name="main">
    <xsl:try>
      <xsl:value-of select="yx:to-json('a:&#10;  b: 1&#10;   c: 2')"/>
      <xsl:catch>
        <xsl:value-of select="local-name-from-QName($err:code) || ' ' || substring-before($err:description, ':')"/>
      </xsl:catch>
    </xsl:try>
  </xsl:template>
</xsl:stylesheet>
