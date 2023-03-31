# Data formatting

This folder contains utilities for creating and manipulating Soldiers XML.

Information about soldiers comes from various sources in a various data formats. Transforming all of these to Soldiers XML gives a firm basis to work with when comparing source data with the database, loading new information to the database, and merging source data to create a biography for a soldier.

## Preparing Data

First, we need to create Soldiers XML. For example, by [extracting data from a spreadsheet](spreadsheet.md). Next, we need make sure that fields in the Soldiers XML are used in a consistent way that lets you compare them with the same fields in the database. This is [data normalization](normalization.md).

## Searching the database

We want to take a file of Soldiers XML and compare the whole lot against the database in one go. There's lots to discuss elsewhere in how this happens, but here we are concerned with what the results might be. The idea is we go through a file of Soldiers XML and check each **person** entry against the database in turn. There are three possible outcomes:

1. There is an exact match in the database, or at least only one suitably close match. In this case the person is *identified*.
1. There is no exact match, and more than one close match. The person is *ambiguous*.
1. There is not even a close match in the database. The person is *unknown*.

The search process adds a **candidate** element to each person for each suitable match. You end up with a single **candidate** if the person is identified, none if the person is unknown, and more than one if the person is ambiguous.

## Filtering

Having searched against the database, we may want to select all the person entries that are identified, all that are ambiguous, or all that are unknown. The XSLT stylesheets that do this are [filter-identified.xsl](xsl/filter-identified.xsl), [filter-ambiguous.xsl](xsl/filter-ambiguous.xsl) and [filter-unknown.xsl](xsl/filter-unknown.xsl).
