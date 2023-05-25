## An Example

Let's use the CWGC Find War Dead site to find [First World War soldiers buried in Magdalen Hill Cemetery, Winchester](https://www.cwgc.org/find-records/find-war-dead/search-results/?Surname=&Forename=&Initials=&ServiceNum=&Regiment=&WarSelect=1&Cemetery=WINCHESTER+%28MAGDALEN+HILL%29+CEMETERY&CountryCommemoratedIn=null&Unit=&Rank=&SecondaryRegiment=&AgeOfDeath=0&DateDeathFromDay=1&DateDeathFromMonth=January&DateDeathFromYear=&DateDeathToDay=1&DateDeathToMonth=January&DateDeathToYear=&DateOfDeath=&Honours=null&AdditionalInfo=). The results page has a *Download all results* link that creates a comma-separated values (.csv) file. Open this in Excel or Open Office, save, it in OpenDocument Spreadsheet format (.ods) format, and extract the data, as described [here](../spreadsheet.md).

The result is [spreadsheet.xml](spreadsheet.xml). You'll see that row 1 has the column names, so we can apply **col-names.xsl** to get [spreadsheet-names.xml](spreadsheet-names.xml). This last step isn't strictly necessary, but it makes writing the custom stylesheet easier, and the result more readable.

The final step is to create the Soldiers XML, using a custom stylesheet that depends on the source of the data. In this case, **cwgc.xsl**. The result is [Soldiers XML](soldiers.xml).
