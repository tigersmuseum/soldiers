# Extracting data from a spreadsheet

We operate on OpenDocument Spreadsheet format (.ods) files. This is the format used by Open Office, and is one of the "Save As" options in Microsoft Excel. The .ods file is a compressed zip file archive. The data is the **content.xml** file inside this archive. Extract it, and apply **spreadsheet.xsl**. The output is an XML file consisting of sheets, rows within sheets and cells within rows. Each cell has a column number as its **index** attribute.

Optionally, if the spreadsheet has column headings, then **col-names.xsl** can be applied to the output to add the name of each column as a *col* attribute to each *cell* element. This spreadsheet takes a **headingrow** parameter to indicate which row contains headings. The default is row 1.

We then use an XSL stylesheet to transform the XML generated from the spreadsheet to Soldiers XML. This, of course, need to be different for each source spreadsheet format.

This [worked example](example) demonstrates the process.
