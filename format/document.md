# Extracting data from a word processor document

The general idea is to convert a word processor document to XHTML, then recover Soldiers XML from the XHTML.

## OpenDocument Text

We generally operate on OpenDocument Text format (.odt) files. This is the format used by Open Office, and is one of the "Save As" options in Microsoft Word. The .odt file is a zip compressed file archive. The data is the **content.xml** file inside this archive. Extract it, and apply [document.xsl](xsl/document.xsl). The output is an XHTML version of the original document.

XHTML is a well formed XML and therefore easy to manipulate in software. XHTML displays in a web browser so it's easy to see what you've got. What you've got might be more or less anything, so there's not much more to say here. It's worth noting though, that the style labels in the document carry through to *class* attributes on XHTML elements. You can use these to create a CSS stylesheet that makes the XHTML look nice in a browser, or you can exploit them in extracting "semantic" information from the XHTML if they mean something.

## Word  

A Word (.doc) file is also a zip archive file. The data for the main body of the text is the **word/document.xml** file inside this archive.
Headers, footers, footnotes etc. are in separate files.
The [word.xsl](xsl/word.xsl) stylesheet operates directly on Word XML.

## Issues

### Text style

OpenDocument XML defines distinct named styles that are referenced by text fragments. Word XML takes a different approach, and includes style information with each text fragment.
Saving a Word file as ODT creates a new named style for each fragment.
The result is that the conversion of Word files to XHTML via ODT creates a new HTML class each time a style is used, rather than just once for each style defined in the Word document. This makes it complicated and cumbersome (but not impossible) to do something useful with class attributes generated from Word styles.

### Indenting

The generated XHTML is not indented. This makes it harder to read, or hand edit, if that's what you want to do. It's easy to make the output indented,
but there's a risk of introducing unwanted whitespace. For example, introducing a space before a *<sup>* element.
XSLT utilities for "pretty printing" XHTML would be useful.
