# Parsing mentions of Soldiers

Source may be unstructured text or entries in spreadsheets. How spreadsheets are structured depends on the source and the trnascriber. There will be a lot of variety.

The basic approach is to construct Soldiers XML, whatever the source.

XML data has the concepts of "well formed" and "valid". Well formed XML meets the minimum rules to make it parseable. It can be processed and analysed. Valid XML meets the fulfils all the rules of a particular type of XML, so that the right things are in the right fields, and expressed in the right way.

We aim initially for well-formed XML from source material through pre-processing that depends on the source data.

Some common features are:

...

addressed by pre-processing - regular expressions, xslt - or both.

## Data

input might be a simple text list. Perhaps, copied and pasted from OCR output.

input might be from a word processor document.
Input might be from a spreadsheet.

For input from a word processor or spreadsheet, the process is to convert the source to XML and then apply an XSL transform to create soldiers XML.
We operate on the [Open Document Format for Office Applications (ODF)]()https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=office.
This is supported directly by Open Office, and Microsoft Office has options to save documents and spreadsheets in these formats.


## Tools

XSL transforms - see ...
Java code - see ...
Judicious use of regular expressions in an edtor.

## Commonly encountered issues

* The same field may hold either initials or forenames.

The strategy here is to construct the Soldiers XML with either an *intials* or *forenames* element, then post process to decide what the contents
are, renaming the element if appropriate. This can usually be done by "find and replace" with regular expressions in an editor.

* Ranks are expressed in many different ways.
* Initials may or may not have spaces between them, or be followed by full stops.
* Only one forename might be known. A forename and middle initial(s) can be considered as forenames.

# Regular expressions
* Forenames in an initials field:

	<initials>([A-Z][a-z]+\s*)+</initials>
	<forenames>$1</forenames>


 