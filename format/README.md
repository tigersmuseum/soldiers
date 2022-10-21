# Data formatting

Utilities for creating and manipulating Soldiers XML

## Extracting data from a spreadsheet

We operate on OpenDocument Spreadsheet format (.ods) files. This is the format used by Open Office, and is one of the "Save As" options in Microsoft Excel. The .ods file is a compressed zip file archive. The data is the **content.xml** file inside this archive. Extract it, and apply **spreadsheet.xsl**. The output is an XML file consisting of sheets, rows within sheets and cells within rows. Each cell has a column number as its **index** attribute.

If the spreadsheet has column headings, then **col-names.xsl** can be used to added the name of each column as a *col* attribute to each *cell* element. The spreadsheet takes a **headingrow** parameter to indicate which row contains headings. This defaults to 1.