# Extracting data from a word processor document

We operate on OpenDocument Text format (.odt) files. This is the format used by Open Office, and is one of the "Save As" options in Microsoft Word. The .odt file is a compressed zip file archive. The data is the **content.xml** file inside this archive. Extract it, and apply **document.xsl**. The output is an XHTML version of the original document.
