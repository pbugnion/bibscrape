
BIBSCRAPE
=========

Bibscrape is a lightweight web scraper for fetching bibtex citations from journals:

    $ bibscrape prl 111 045301
    @article{Bugnion2013,
      title = {Inhomogeneous State of Few-Fermion Superfluids},
      author = {Bugnion, P. O. and Lofthouse, J. A. and Conduit, G. J.},
      journal = {Phys. Rev. Lett.},
      volume = {111},
      issue = {4},
      pages = {045301},
      numpages = {5},
      year = {2013},
      month = {Jul},
      publisher = {American Physical Society},
      doi = {10.1103/PhysRevLett.111.045301},
      url = {http://link.aps.org/doi/10.1103/PhysRevLett.111.045301}
    }

It can currently fetch citations from the APS journals (Physical Review, Phys.
Rev. Lett., Phys. Rev. A-E and Review of Modern Physics) and from the Journal
of Chemical Physics. Adding further journals depends on how accessible they
make their bibtex export functions.

A help menu is available with ``$ bibscrape --help``.

Requirements
------------

An internet connection and a Python 2.x installation.


Acknowledgements
----------------

This code relies extensively on Francois Boulogne's
[bibtexparser](https://github.com/sciunto/python-bibtexparser) python library
(licensed under the LGPL).
