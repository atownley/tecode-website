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
// File:	article.xsl
// Created:	Sat Nov 20 20:08:43 GMT 2004
//
// $Id: article.xsl,v 1.1 2004/11/21 20:37:36 atownley Exp $
//
//////////////////////////////////////////////////////////////////////
-->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="common.xsl"/>
<xsl:include href="menu.xsl"/>
<xsl:output method="html"/>

<xsl:template match="article">
<!--
  This is a nasty, nasty bit of stuff, but I don't know the best way
  to do it otherwise... :(
  -->
  <xsl:choose>
  <xsl:when test="@class != ''">
  <div class="{@class}">
  <h3>
  <xsl:if test="@date != ''"><xsl:value-of select="@date"/>&#160;</xsl:if><xsl:value-of select="title"/>
  </h3>
  <xsl:apply-templates select="body/*"/>
  </div>
  </xsl:when>
  <xsl:otherwise>
  <div class="article">
  <h3>
  <xsl:if test="@date != ''"><xsl:value-of select="@date"/>&#160;</xsl:if><xsl:value-of select="title"/>
  </h3>
  <xsl:apply-templates select="body/*"/>
  </div>
  </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
