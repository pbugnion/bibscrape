#!/bin/bash

# Get bibtex entries for APS journals

if [ $# -ne 3 ] ; then
    echo "Usage journal volume number"
    exit
fi

journal=$1
volume=$2
number=$3

if [ $journal = "pra" ] ; then
    full_name=PhysRevA
elif [ $journal = "prb" ] ; then
    full_name=PhysRevB
elif [ $journal = "prc" ] ; then
    full_name=PhysRevC
elif [ $journal = "prl" ] ; then
    full_name=PhysRevLett
elif [ $journal = "pre" ] ; then
    full_name=PhysRevE
elif [ $journal = "pr" ] ; then
    journal=archive
    full_name="PhysRev"
elif [ $journal = "rmp" ] ; then
    full_name="RevModPhys"
else
    echo "Journal must be one of: "
    echo "pra, prb, prc, pre, prl, rmp or pr"
    exit
fi

wget "http://journals.aps.org/$journal/export/10.1103/$full_name.$volume.$number?type=bibtex&download=true" -O cite.out

if [ $? -ne 0 ] ; then
    echo "Download failed."
    exit 2
fi

echo "" >> cite.out
