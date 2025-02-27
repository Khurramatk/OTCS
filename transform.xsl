<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Mindmap</title>
                <style>
                    .mindmap {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                    }
                    .node {
                        margin: 10px;
                        padding: 10px;
                        border: 1px solid #000;
                        border-radius: 5px;
                        text-align: center;
                    }
                    .children {
                        display: flex;
                        justify-content: space-around;
                    }
                </style>
            </head>
            <body>
                <div class="mindmap">
                    <xsl:apply-templates select="mindmap/node"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="node">
        <div class="node">
            <xsl:value-of select="@label"/>
            <xsl:if test="node">
                <div class="children">
                    <xsl:apply-templates select="node"/>
                </div>
            </xsl:if>
        </div>
    </xsl:template>
</xsl:stylesheet>