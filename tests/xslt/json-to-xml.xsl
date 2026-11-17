<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:jx="https://phoenixml.dev/modules/xslt/json" exclude-result-prefixes="#all">
  <xsl:import href="../../xslt/json.xsl"/>
  <xsl:template name="main">
    <xsl:sequence select="jx:to-xml('{&quot;name&quot;:&quot;pen&quot;,&quot;tags&quot;:[&quot;a&quot;,&quot;b&quot;],&quot;my key&quot;:null,&quot;n&quot;:{&quot;x&quot;:1.5,&quot;ok&quot;:true},&quot;e&quot;:[]}', 'data')"/>
  </xsl:template>
</xsl:stylesheet>
