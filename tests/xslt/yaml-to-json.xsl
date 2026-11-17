<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:yx="https://phoenixml.dev/modules/xslt/yaml" exclude-result-prefixes="#all">
  <xsl:import href="../../xslt/yaml.xsl"/>
  <xsl:output method="text"/>
  <xsl:template name="main">
    <xsl:value-of select="yx:to-json(unparsed-text('../data/config.yaml'))"/>
  </xsl:template>
</xsl:stylesheet>
