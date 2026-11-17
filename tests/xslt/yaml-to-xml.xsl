<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:yx="https://phoenixml.dev/modules/xslt/yaml" exclude-result-prefixes="#all">
  <xsl:import href="../../xslt/yaml.xsl"/>
  <xsl:template name="main">
    <xsl:sequence select="yx:to-xml('servers:&#10;  - host: alpha&#10;    tags: [web, eu]&#10;&quot;a b&quot;: 1&#10;', 'config')"/>
  </xsl:template>
</xsl:stylesheet>
