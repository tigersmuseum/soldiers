# Data Normalization

Fields in a database must be in a standard form so that they can be compared.

## Ranks

In particular, the soldiers database must have rules governing how ranks are expressed. The standard form of ranks in a soldiers database is given by the *ranks* table. You can, if you wish, edit this as you see fit, but it makes sense to adopt a common standard for ranks. The database schema therefore comes with a [rank.csv](../data/rank.csv) file that offers such a standard. The [soldiers-java](https://github.com/tigersmuseum/soldiers-java) repository includes a utility (*soldiers.database.Normalize*) that normalizes ranks in Soldiers XML so that each rank attribute is set to best match from **rank.csv**.