# Hospital Admission and Discharge registers

Admission and Discharge registers are held in the [MH 106 Division](https://discovery.nationalarchives.gov.uk/browse/r/h/C10949) of The National Archives (TNA). Instructions for citing TNA records can be found [here](https://www.nationalarchives.gov.uk/help-with-your-research/citing-records-national-archives/).

We model historical documents as [SKOS](https://www.w3.org/TR/skos-primer/) concepts. For documents held by TNA, we use the citation URL as its [URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) and set the SKOS *notation* property to the TNA record reference. Each register covers a specific period of time, so we also model it as an [OWL Time](https://www.w3.org/TR/owl-time/) *ProperInterval*. We collect registers for the same unit or hospital in a [RDF Bag](https://www.w3.org/TR/rdf-schema/#ch_containervocab) container.


The resulting [linked data](https://en.wikipedia.org/wiki/Linked_data) file is [hospital-books.xml](hospital-books.xml), formatted as [RDF XML](https://www.w3.org/TR/rdf-syntax-grammar/). The file [hospital-books.xhtml](hospital-books.xhtml) is a more readable HTML version. It covers those registers transcribed by volunteers at the Royal Hampshire Regiment Museum and is not exhaustive.