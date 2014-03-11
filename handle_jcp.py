
"""
Hack to extract links from JCP search results.

$ handle.py <file_name>

will return a link to the first result of a JCP search. 

If there are no search results, gives a return code of 4.
If there is at least one search result, prints the href in
the "<a title="Link to Article" href="..."> tag.
"""

import sys
from HTMLParser import HTMLParser

found = False

class Parser(HTMLParser):

    def handle_starttag(self,tag,attrs):
        global found
        if tag == "a":
            if ("title","Link to Article") in attrs:
                found = True
                for attr_name, attr_value in attrs:
                    if attr_name == "href":
                        print attr_value.split(";")[0]


parser = Parser()

with open(sys.argv[1]) as f:
    html_text = f.read()

parser.feed(html_text)

if not found:
    sys.exit(4)

