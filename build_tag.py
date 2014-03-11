#!/usr/bin/env python

"""
Reads a file containing a citation, extracts the first author
and date and return the citation with tag <author><date>.
"""

from bparser import BibTexParser
from bib_custom import author as get_author
import sys

with open(sys.argv[1]) as f:
    parser = BibTexParser(f)

records = parser.get_entry_list()
record0 = get_author(records[0])
author = records[0]["author"][0]
author_surname = author.split(",")[0].strip()
year = str(record0["year"])

new_tag = author_surname + year

print new_tag

