<?xml version="1.0"?>

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Make output pretty -->			
  <xsl:output method="text"/>

  <xsl:template match="resume">
    <xsl:apply-templates select="personal|objective"/>
  </xsl:template>

  <xsl:template match="personal">
    <xsl:value-of select="name/first"/> <xsl:value-of select="name/last"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="address/street"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="address/city"/>, <xsl:value-of select="address/state"/>, <xsl:value-of select="address/zip"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="phone"/>
  </xsl:template>

  <xsl:template match="objective">
    <xsl:text>&#xA;&#xA;Objective:  </xsl:text>
    <xsl:value-of select="normalize-space()"/>
  </xsl:template>

</xsl:stylesheet>
