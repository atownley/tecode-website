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
// File:	common.xsl
// Created:	Sat Nov 20 20:17:35 GMT 2004
//
// $Id: common.xsl,v 1.1 2004/11/21 20:37:36 atownley Exp $
//
//////////////////////////////////////////////////////////////////////
-->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:variable name="page" select="/" />
<xsl:variable name="layout" select="document('base.html')" />
<xsl:key name="listing" match="example" use="."/>

<xsl:template match="/">
  <xsl:apply-templates select="$layout/html"/>
</xsl:template>

<xsl:template match="page-title">
  TE-CODE <xsl:value-of select="$page/page/@title"/>
</xsl:template>

<xsl:template match="page-content">
  <xsl:apply-templates select="$page/page/*"/>
</xsl:template>

<!-- format a book reference -->
<xsl:template match="book">
  <a href="{@link}"><xsl:value-of select="text()"/></a>
</xsl:template>

<!-- format a code example -->
<xsl:template match="example">
  <pre class="example">
  <xsl:apply-templates />
  </pre>
  <xsl:if test="@caption != ''">
  <p class="caption">
    <xsl:value-of select="@caption"/>
  </p>
  </xsl:if>
</xsl:template>

<xsl:template match="@*|*">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
