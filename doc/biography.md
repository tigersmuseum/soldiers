# Biography

Museum and volunteer research produces biographies.
We want to identify and label the soldiers mentioned in these biographies by database soldier ID (SID).

Biographical research comes in a variety of formats, typically word processor documents. We convert all formats to XHTML to make them easier to process.
A word processor document may cover many soldiers. We can make the soldiers distinct in the XHTML by enclosing each in an HTML *article*.

Once identified, we make the database SID the *id* attribute on the *article* element. We can then use it in the hash fragment of a URL pointing to that
biography. We also use the SID to construct a soldier [URN](https://en.wikipedia.org/wiki/Uniform_Resource_Name) in the *about* attribute, paving the way for linked data. A couple more attributes on the *article* element further enable machine processing: a *content* attribute with name, rank and number; and a *sort* attribute with surname and initials. These allow a large XHTML file with lots of biographical articles to be be indexed.

    <article id="128434" content="6705 Pte W EADES" sort="EADES, W" about="urn:winhr:sid:128434">

