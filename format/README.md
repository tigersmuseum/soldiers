# Data formatting

Utilities for creating and manipulating Soldiers XML.

## Extracting data from a spreadsheet

We operate on OpenDocument Spreadsheet format (.ods) files. This is the format used by Open Office, and is one of the "Save As" options in Microsoft Excel. The .ods file is a compressed zip file archive. The data is the **content.xml** file inside this archive. Extract it, and apply **spreadsheet.xsl**. The output is an XML file consisting of sheets, rows within sheets and cells within rows. Each cell has a column number as its **index** attribute.

Optionally, if the spreadsheet has column headings, then **col-names.xsl** can be applied to the output to add the name of each column as a *col* attribute to each *cell* element. This spreadsheet takes a **headingrow** parameter to indicate which row contains headings. The default is row 1.

We then use an XSL stylesheet to transform the XML generated from the spreadsheet to Soldiers XML. This, of course, need to be different for each source spreadsheet format.

### An Example

Let's use the CWGC Find War Dead site to find [First World War soldiers buried in Magdalen Hill Cemetery, Winchester](https://www.cwgc.org/find-records/find-war-dead/search-results/?Surname=&Forename=&Initials=&ServiceNum=&Regiment=&WarSelect=1&Cemetery=WINCHESTER+%28MAGDALEN+HILL%29+CEMETERY&CountryCommemoratedIn=null&Unit=&Rank=&SecondaryRegiment=&AgeOfDeath=0&DateDeathFromDay=1&DateDeathFromMonth=January&DateDeathFromYear=&DateDeathToDay=1&DateDeathToMonth=January&DateDeathToYear=&DateOfDeath=&Honours=null&AdditionalInfo=). The results page has a *Download all results* link that creates a comma-separated values (.csv) file. Open this in Excel or Open Office, and extra the data as described above.

The output from **spreadsheet.xsl** looks like [this](example/spreadsheet.xml). You'll see that row 1 has the column names, so we can apply **col-names.xsl** to get [this](example/spreadsheet-names.xml). This last step isn't strictly necessary, but it makes writing the custom stylesheet easier, and the result more readable.

The final step is to create the Soldiers XML, using a custom stylesheet that depends on the source of the data. In this case, **cwgc.xsl**. The result is [Soldiers XML](example/soldiers.xml).


## Normalization

Fields in a database must be in a standard form so that they can be compared. In particular, the soldiers database must have rules governing how ranks are expressed. The standard form of ranks in a soldiers database is given by the *ranks* table. You can, if you wish, edit this as you see fit, but it makes sense to adopt a common standard for ranks. The database schema therefore comes with a [rank.csv](../data/rank.csv) file that offers such a standard. The [soldiers-java](https://github.com/tigersmuseum/soldiers-java) repository includes a utility (*soldiers.database.Normalize*) that normalizes ranks in Soldiers XML so that each rank attribute is set to best match from **rank.csv**.