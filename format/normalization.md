# Data Normalization

Fields in a database must be in a standard form so that they can be compared.

## Ranks

In particular, the soldiers database must have rules governing how ranks are expressed. The standard form of ranks in a soldiers database is given by the *ranks* table. You can, if you wish, edit this as you see fit, but it makes sense to adopt a common standard for ranks. The database schema therefore comes with a [rank.csv](../data/rank.csv) file that offers such a standard.

The *soldiers.database.Normalize* utility (see [soldiers-java](https://github.com/tigersmuseum/soldiers-java)) normalizes ranks in Soldiers XML so that each rank attribute is set to the best match from **rank.csv**.

## Dates

The database uses the [ISO 8601 format](https://en.wikipedia.org/wiki/ISO_8601) (*YYYY-MM-DD*) for dates.

The *soldiers.database.Normalize* utility (see [soldiers-java](https://github.com/tigersmuseum/soldiers-java)) will convert a variety of date expressions in Soldiers XML to ISO 8601. It will also try to do the sensible thing with dates where the day of the month isn't known, or where only the year is known. Strictly, the *date* attribute on *birth* and *death* elements should specify year, month and day. If it's only a year, or only a year and month, then it will be replaced with *before* and *after* attributes calculated appropriately.

The *after* and *before* attributes on *birth*, *death* elements are for use when the precise date isn't known, but it's possible to set a boundary on the date. They are also used on *service* elements to record the start and end of that service. An *after* attribute given as just a year will be set to the first day of that year. One given as just year and month will be set to the first day of the month. Similarly, imprecise dates for *before* attributes will be set to the last day of the year or month.
