<?xml version="1.0"?>

<!-- Transforms my format to Sean Kelly's
     See http://xmlresume.sourceforge.net/ 
-->

<xsl:stylesheet version="1.0"
	 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Make output pretty -->			
  <xsl:output method="xml" indent="yes" />

  <!-- Ignore whitespace -->
  <xsl:strip-space elements="*"/>

  <!-- Override default behavior of matching all text elements --> 
<!--   <xsl:template match="text()"/> -->

  <xsl:template match="resume">
    <xsl:copy>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="personal">
    <header>
      <name>
	<firstname><xsl:value-of select="name/first"/></firstname>
	<surname><xsl:value-of select="name/last"/></surname>
      </name>
      <xsl:copy-of select="address"/>
      <contact>
	<xsl:copy-of select="phone"/>
	<xsl:copy-of select="email"/>
	<xsl:copy-of select="url"/>
      </contact>
    </header>
    <objective><para><xsl:value-of select="objective"/></para></objective>
  </xsl:template>

  <xsl:template match="employment">
    <history>
      <xsl:apply-templates select="job"/>
    </history>
  </xsl:template>

  <xsl:template match="job">
    <xsl:copy>
      <jobtitle><xsl:value-of select="title"/></jobtitle>
      <employer><xsl:value-of select="employer/name"/></employer>
      <xsl:copy-of select="period"/>
      <description>
	<para><xsl:value-of select="description"/></para>
	<xsl:apply-templates select="projects/project"/>
      </description>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="project">
    <para><xsl:apply-templates/></para>
  </xsl:template>

  <xsl:template match="project/period"/>

  <xsl:template match="project/bullet">
    <emphasis><xsl:value-of select="."/></emphasis>
  </xsl:template>

  <xsl:template match="education">
    <academics>
      <degrees>
	<xsl:apply-templates select="degree"/>
      </degrees>
      <xsl:copy-of select="note"/>
    </academics>
  </xsl:template>

  <xsl:template match="degree">
    <xsl:copy>
      <xsl:copy-of select="level"/>
      <xsl:copy-of select="subject"/>
      <xsl:copy-of select="date"/>
      <xsl:copy-of select="institution"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="skills">
    <skillareas>
      <xsl:apply-templates/>
    </skillareas>
  </xsl:template>

  <xsl:template match="skillset">
    <skillarea>
      <xsl:copy-of select="title"/>
      <skillset>
	<skills>
	  <xsl:copy-of select="skill"/>
	</skills>
      </skillset>
    </skillarea>
  </xsl:template>

</xsl:stylesheet>