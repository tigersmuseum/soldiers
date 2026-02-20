# Extracting data from a word processor document

The general idea is to convert a word processor document to XHTML, then recover Soldiers XML from the XHTML.

## OpenDocument Text

We generally operate on OpenDocument Text format (.odt) files. This is the format used by Open Office, and is one of the "Save As" options in Microsoft Word. The .odt file is a zip compressed file archive. The data is the **content.xml** file inside this archive. Extract it, and apply [document.xsl](xsl/document.xsl). The output is an XHTML version of the original document.

XHTML is a well formed XML and therefore easy to manipulate in software. XHTML displays in a web browser so it's easy to see what you've got. What you've got might be more or less anything, so there's not much more to say here. It's worth noting though, that the style labels in the document carry through to *class* attributes on XHTML elements. You can use these to create a CSS stylesheet that makes the XHTML look nice in a browser, or you can exploit them in extracting "semantic" information from the XHTML if they mean something.

Unfortunately, the conversion of Word files to ODT creates a new HTML class each time a style is used, rather than just once for each style defined in the Word document. This makes it complicated and cumbersome (but not impossible) to do something useful with class attributes generated from Word styles.

## Word  

A .doc file is also a zip file. The data is the **word/document.xml** file inside this archive. Development of  stylesheet for this is work-in-progress.