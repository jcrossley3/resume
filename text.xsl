<?xml version="1.0"?>

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Make output pretty -->			
  <xsl:output method="text"/>

  <!-- Ignore whitespace -->
<!--   <xsl:strip-space elements="*"/> -->

  <xsl:template match="resume">
    <xsl:apply-templates select="personal|objective|employment"/>
  </xsl:template>

  <xsl:template match="personal">
    <xsl:value-of select="name/first"/><xsl:text> </xsl:text><xsl:value-of select="name/last"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="address/street"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="address/city"/>, <xsl:value-of select="address/state"/>, <xsl:value-of select="address/zip"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:value-of select="phone"/>
  </xsl:template>

  <xsl:template match="objective">
    <xsl:text>&#xA;&#xA;Objective:  </xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&#xA;</xsl:text>
  </xsl:template>

  <xsl:template match="employment">
    <xsl:apply-templates select="job"/>
  </xsl:template>

  <xsl:template match="employer">
    <xsl:value-of select="name"/>, <xsl:value-of select="location"/>
  </xsl:template>

  <xsl:template match="job">
    <xsl:value-of select="normalize-space(title)"/> at <xsl:apply-templates select="employer"/>
    <xsl:apply-templates select="period/from"/>
    <xsl:text> - </xsl:text>
    <xsl:apply-templates select="period/to"/>
  </xsl:template>

  <xsl:template match="date">
    <xsl:value-of select="month"/>
    <xsl:text>/</xsl:text>
    <xsl:value-of select="year"/>
  </xsl:template>
</xsl:stylesheet>
