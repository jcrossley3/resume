<?xml version="1.0"?>

<!DOCTYPE xsl:stylesheet [
   <!ENTITY nbsp "&#160;"> 
   ]>

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Make output pretty -->			
  <xsl:output method="html" indent="yes" />

  <xsl:template match="resume">
    <html>
      <head>
	<title>Resume</title>
      </head>
      <body bgcolor="white">
	<center>
	  <h6><a href="resume.doc">MS-Word version</a></h6>
	  <table width="640" border="0" cellpadding="5" cellspacing="5">  
	    <xsl:apply-templates/>
	  </table>
	</center>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="personal">
    <tr>
      <td colSpan="2">
        <table width="640">
          <tr>
            <td align="center">
              <h2>
		<xsl:value-of select="name/first"/>&nbsp;<xsl:value-of select="name/last"/>
	      </h2>
            </td>
            <td align="right">
              <xsl:value-of select="address/street"/>,&nbsp;
	      <xsl:value-of select="address/city"/>,&nbsp;
	      <xsl:value-of select="address/state"/>&nbsp;
	      <xsl:value-of select="address/zip"/>
              <br/>
              <xsl:value-of select="phone"/>
              <br/>
              <a href="mailto:{email}"><xsl:value-of select="email"/></a>
              <br/>
              <a href="{url}"><xsl:value-of select="url"/></a>   
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="objective">
    <tr>
      <td width="100" valign="top" bgcolor="#cccccc">
        <b>Objective</b>
      </td>
      <td align="left" valign="top" >
	<xsl:value-of select="normalize-space()"/>
      </td>
    </tr> 
  </xsl:template>

  <xsl:template match="skills">
    <tr>
      <td width="100" valign="top" bgcolor="#cccccc">
        <b>Skills</b>
      </td>
      <td align="left" valign="top">
        <ul>
	  <xsl:apply-templates/>
        </ul>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="skillset">
    <li>
      <em><xsl:value-of select="title"/></em><br/>
      <xsl:for-each select="skill">
	<xsl:value-of select="normalize-space()"/>
	<xsl:if test="not(position()=last())">, </xsl:if>
      </xsl:for-each>
    </li>
  </xsl:template>

  <xsl:template match="employment">
    <tr>
      <td width="100" valign="top" bgcolor="#cccccc">
        <b>Experience</b>
      </td>
      <td align="left" valign="top">	   
        <table cellpadding="0" cellspacing="0">
          <xsl:apply-templates/>
        </table> 
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="period">
    (<xsl:value-of select="from/date/month"/>/<xsl:value-of select="from/date/year"/>
    <xsl:text>-</xsl:text>
    <xsl:choose>
      <xsl:when test="to/present">
	<xsl:text>Present)</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="to/date/month"/>/<xsl:value-of select="to/date/year"/>)
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="job">
    <tr>
      <td align="left" valign="top">
	<em><xsl:value-of select="employer/name"/></em> -- <xsl:value-of select="employer/location"/>
      </td>
      <td align="right" valign="top" rowspan="2">
	<b><xsl:apply-templates select="period"/></b>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
	<b><xsl:value-of select="title"/></b>
      </td>
    </tr>
    <tr>
      <td colspan="2">
	<xsl:value-of select="description"/>
	<xsl:apply-templates select="projects"/>
      </td>
    </tr>
    <tr><td><br/></td></tr>
  </xsl:template>

  <xsl:template match="projects">
    <p><b>Projects:</b></p>
    <ul>
      <xsl:apply-templates select="project"/>
    </ul>
  </xsl:template>

  <xsl:template match="project">
    <li>
      <xsl:value-of select="text()"/> <xsl:apply-templates select="period"/>
      <xsl:if test="self::node()[bullet]"> 
	<ul>
	  <xsl:apply-templates select="bullet"/>
	</ul>
      </xsl:if>
    </li>
  </xsl:template>

  <xsl:template match="bullet">
    <li>
      <xsl:value-of select="."/>
    </li>
  </xsl:template>

  <xsl:template match="education">
    <tr>
      <td width="100" valign="top" bgcolor="#cccccc">
        <b>Education</b>
      </td>
      <td align="left" valign="top">	   
        <table border="0" cellpadding="0" cellspacing="0">
	  <xsl:apply-templates select="degree"/>

	  <tr><td>&nbsp;</td></tr>

	  <tr>
	    <td colspan="2">
	      <xsl:value-of select="note"/>
	    </td>
	  </tr>
        </table>
      </td>
    </tr> 		
  </xsl:template>

  <xsl:template match="degree">
    <tr>
      <td align="left" valign="top">
	<em><xsl:value-of select="institution"/></em>
      </td>
      <td align="right" valign="top" rowspan="2">
	<b><xsl:value-of select="date/month"/>&nbsp;<xsl:value-of select="date/year"/></b>
      </td>
    </tr>
    <tr>
      <td align="left" valign="top">
	<b><xsl:value-of select="level"/> of <xsl:value-of select="subject"/></b> 
      </td> 
    </tr>
  </xsl:template>

</xsl:stylesheet>