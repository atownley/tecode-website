<?xml version="1.0"?>
<!--
//////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2004, Andrew S. Townley
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// 
//     * Redistributions of source code must retain the above
//     copyright notice, this list of conditions and the following
//     disclaimer.
// 
//     * Redistributions in binary form must reproduce the above
//     copyright notice, this list of conditions and the following
//     disclaimer in the documentation and/or other materials provided
//     with the distribution.
// 
//     * Neither the names Andrew Townley and Townley Enterprises,
//     Inc. nor the names of its contributors may be used to endorse
//     or promote products derived from this software without specific
//     prior written permission.  
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
// OF THE POSSIBILITY OF SUCH DAMAGE.
//
// File:	menu.xsl
// Created:	Sat Nov 20 20:08:56 GMT 2004
//
// $Id: menu.xsl,v 1.1 2004/11/21 20:37:36 atownley Exp $
//
//////////////////////////////////////////////////////////////////////
-->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

<xsl:template match="page-menu">
  <xsl:apply-templates select="document($page/page/menu/@ref)" mode="menu"/>
</xsl:template>

<!-- ignore the menu item as it's really a processing directive -->
<xsl:template match="menu">
</xsl:template>

<xsl:template match="menu" mode="menu">
  <xsl:apply-templates mode="menu"/> 
  <p class="menu">
  <a href="http://sourceforge.net"><img 
    src="http://sourceforge.net/sflogo.php?group_id=82738&amp;type=1"
    width="88" height="31" border="0" alt="SourceForge.net Logo"
    align="center" /></a>
  </p>
</xsl:template>

<xsl:template match="item" mode="menu">
  <xsl:choose>
    <xsl:when test="$page/page/menu/@active = @name">
      <p class="active"><xsl:value-of select="text()"/></p>
    </xsl:when>
    <xsl:otherwise>
      <p class="menu"><a class="navlink" href="{@link}"><xsl:value-of select="text()"/></a></p>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="@*|*">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
