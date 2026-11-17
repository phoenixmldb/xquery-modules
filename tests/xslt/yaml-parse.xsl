<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:yx="https://phoenixml.dev/modules/xslt/yaml" exclude-result-prefixes="#all">
  <xsl:import href="../../xslt/yaml.xsl"/>
  <xsl:output method="text"/>
  <xsl:template name="main">
    <xsl:variable name="c" select="yx:parse(unparsed-text('../data/config.yaml'))"/>
    <xsl:value-of select="$c?servers?1?host, $c?port, $c?limits?memory, array:size($c?paths)" separator="&#10;"
        xmlns:array="http://www.w3.org/2005/xpath-functions/array"/>
  </xsl:template>
</xsl:stylesheet>
