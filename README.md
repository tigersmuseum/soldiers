# soldiers
A [database schema](schema) for soldiers and their service records.

The database was originally created for the Royal Hampshire Regiment Museum to record the soldiers who served in the regiment and its antecedents. The design is general purpose however, so could be used in the same way by any regimental museum.

As well as the database, this repository contains the definition of a **Soldiers XML** data format to represent information about a soldier. Use of this format with the database is optional, but it provides a standard representation of the information needed to populate the database, and allows additional source specific information to be recorded as *notes*.

The [format](format) folder in this repository contains XSLT spreadsheets for creating and manipulating Soldiers XML. The [report](report) folder has spreadsheets for generating HTML from Soldiers XML. The [mentions](mentions) folder introduces an optional extra database table that
links soldiers to the source material that mentions them. The [utilities](utilities) folder contains SQL queries for housekeeping.

Java utilities for interacting with the database can be found in the [soldiers-java](https://github.com/tigersmuseum/soldiers-java) repository.

Please contact [archive@royalhampshireregiment.org](mailto:archive@royalhampshireregiment.org) if you have any questions.