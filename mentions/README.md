# Mentions of a soldier in source material

The purpose of the soldiers database is to uniquely identify a soldier. Having done that, we might want to link that identity to mentions of the soldier in source records. How we do this at the Royal Hampshire Regiment museum is described below. The 'core' Soldiers database doesn't depend on anything here, so this can be considered an 'optional extra' - and there are doubtless other ways to achieve the same ends.

## What we do 

Our source data comes in various spreadsheet and documents. We convert these to Soldiers XML files and search against the database to see if the mentioned soldiers are already known. This process is described in the [format](/format) section of this repository. We check the Soldiers XML of any ambiguous or unidentified results for obvious data errors and make any necessary corrections. We make a judgement as to whether ambiguous results really do match one of soldiers in the database, perhaps editing the database as a result. Having done some suitable quality checks, we create new records in the database for the previously unknown soldiers; then repeat the search and filtering steps. Ideally, the result is a Soldiers XML file with a single **candidate** element attached to each **person** - but it might not be possible to uniquely identify everyone, and a few may remain ambiguous.

For each source, the Soldiers XML will have a canonical representation of name, rank and number; together with *notes* that depend on whatever additional information is in the source data. We usually make one file of Soldiers XML for each source, but sometimes have to have more than one if the situation demands (dividing up unmanageably large files for example). Note that the Soldiers XML format from different sources will only differ in the contents of the *notes* element. The basic assumption is that, given the name of the source, we know what the *notes* element will be like.

We maintain a **sources.xml** XML file listing source names and their corresponding Soldiers XML files. See [sources-template.xml](sources-template.xml) file for the structure of this document.

work-in-progress ...