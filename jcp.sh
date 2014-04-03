#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "Usage: $0 volume page"
fi

root=`dirname $0`

wget 'http://scitation.aip.org/search?noRedirect=true&value8=The+Journal+of+Chemical+Physics&option8=journalbooktitle&operator12=AND&option12=resultCategory&value12=ResearchPublicationContent&operator13=AND&value13='$1'&option13=prism_volume&operator14=AND&value14='$2'&option14=elocationpage' -O tmp.htm

if [ $? != 0 ] ; then
    echo Failed to fetch URL
    exit
fi

doi_link=`python $root/handle_jcp.py tmp.htm`

if [ $? != 0 ] ; then
    echo "Search failed."
    exit
fi

url=scitation.aip.org$doi_link/cite/bibtex

wget $url

mv bibtex cite.out
rm tmp.htm
