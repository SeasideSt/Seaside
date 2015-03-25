# Introduction #
Seaside 3.1.1 is a bug fix release for Seaside 3.1.

# Details #

The following changes occurred:
  * Ported to Gemstone 3.1
  * Slime is now available on Squeak, Pharo1.4, Pharo2.0 and Pharo3.0
  * Gettext is now included in the ConfigurationOfSeaside3
  * DateAndTime>>jsonOn: now prints the ISO8601 representation in a string
  * [Issue 783](https://code.google.com/p/seaside/issues/detail?id=783): 	Don’t require nesting #object: in #value: in JSON arrays

# Bugs Fixed #

The following bugs were fixed:
  * [Issue 776](https://code.google.com/p/seaside/issues/detail?id=776): 	Testcase>>#fail is not portable
  * [Issue 779](https://code.google.com/p/seaside/issues/detail?id=779): 	WAVersion uploader broken in 3.1
  * [Issue 780](https://code.google.com/p/seaside/issues/detail?id=780): 	Fixes for the web tools in Pharo3
  * [Issue 781](https://code.google.com/p/seaside/issues/detail?id=781): 	Also catch platform deprecation signals
  * [Issue 784](https://code.google.com/p/seaside/issues/detail?id=784):   Some status code messages are missing from WAResponse class>>initializeStatusMessages
  * [Issue 785](https://code.google.com/p/seaside/issues/detail?id=785): 	Better support recaching in restful filters and handlers
  * [Issue 786](https://code.google.com/p/seaside/issues/detail?id=786): 	Bug in WAAbstractFileLibrary
  * [Issue 787](https://code.google.com/p/seaside/issues/detail?id=787): 	WAUrl relies on not portable Stream semantics
  * [Issue 788](https://code.google.com/p/seaside/issues/detail?id=788): 	Screenshot application does not work on Pharo 2.0+
  * [Issue 789](https://code.google.com/p/seaside/issues/detail?id=789):   Running WAFilelibraryTest on Pharo3 leaves Seaside-Tests-Core package in a dirty state
  * [Issue 792](https://code.google.com/p/seaside/issues/detail?id=792): 	Issue encoding a non-ascii character preceded by an xml-unsafe one