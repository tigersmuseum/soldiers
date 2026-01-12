# Parsing mentions of Soldiers

Source may be unstructured text or entries in spreadsheets. How spreadsheets are structured depends on the source and the transcriber. There will be a lot of variety.

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
We operate on the [Open Document Format for Office Applications (ODF)](https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=office).
This is supported directly by Open Office, and Microsoft Office has options to save documents and spreadsheets in these formats.


## Tools

XSL transforms - see ...
Java code - see ...
Judicious use of regular expressions in an editor.

## Commonly encountered issues

* The same field may hold either initials or forenames.

The strategy here is to construct the Soldiers XML with either an *initials* or *forenames* element, then post process to decide what the contents
are, renaming the element if appropriate. This can usually be done by "find and replace" with regular expressions in an editor.

* Ranks are expressed in many different ways.
* Initials may or may not have spaces between them, or be followed by full stops.
* Only one forename might be known. A forename and middle initial(s) can be considered as forenames.


There will be transcription errors.

# Regular expressions

Some fixes can be made using 'find and replace'note in an editor that supports regular expressions:

* Forenames in an initials field:

	<initials>([A-Z][a-z]+\s*)+</initials>
	<forenames>$1</forenames>

Source material is transcribed to a list of Soldiers XML *person* elements, each of which represents a mention of the person in the source.
A soldier is mentioned only once if the source material is a list of individuals, but other sources may mention the same soldier multiple times

There are two processes to apply to the input: disambiguation and identification. These can be done in either order.
Disambiguation might give extra information that can help with identification.
Disambiguation is easier in the context of sources that record limited numbers of soldiers in specific regions or narrow time frames.
On the other hand, disambiguating mentions that have been definitely identified is easy.
We aim to identify each mention separately, then collect mentions for the same individual.
We may have mentions that that can't be identified, but are similar enough to mentions that can be identified to assume they represent the same person.

There are judgements to be made about completeness and correctness in the database.

We need to find close matches as well as exact matches in the database.
We can search with a function that scores possible matches and set a threshold to determine whether to accept any match or not.
We end up with a single match from the database, multiple acceptable matches from the database, or no match at all.

We relate a mention to a database identifier by the inclusion of one or more *candidate* elements under the *person* element in the Soldiers XML.
The mention is described as *unidentified*, *identified* or *ambiguous* if it has 0, 1 or many *candidate* elements respectively.

We want to collect identified mentions by identity.
If we're sure that two mentions identified as being by the same soldier really are the same, then we might want to merge the two mentions into one.

Each mention typically includes a source-dependent *note* element that gives a source reference and perhaps some extra details.
We might want to collect all the mentions for the same soldier together, so that there is a single *person* element with multiple *note* elements.
This is only safe to do if we're sure that the two mentions really are for the same person.
How sure we can be depends on context.
Nothing is ever completely certain, so we should only do this if there is a way to undo it later if necessary. 
Material from the same source may be split across more than one file.
The same soldier may be mentioned in multiple files, so methods of collecting records for the same soldier may need to work across files.

Searching against the database may produce a close match that suggests an error in transcribing from the historical source, an error in the database, or an error in the source material.
The possibility of a transcription error can be checked if the mention contains a *note* allowing it to be tracked back to source.
A transcription error can be corrected in the original transcript if that is available.
It can always be corrected in the Soldiers XML.
An error in the historical source material can't be corrected at source, shouldn't be corrected in the transcript (which should be a faithful record of the source),
but can be corrected in the Soldiers XML.

It may or may not be practicable to make changes in the transcript and regenerate the XML.
If not, then the generated Soldiers XML represents the authoritative transcript of the historical material.
This is reasonable in cases where a lot of effort is needed in cleaning up data extracted from tables in Word documents or from spreadsheets.
It may be beneficial to have this data as documents or spreadsheets - but 'clean' versions of these can be generated from Soldiers XML.


