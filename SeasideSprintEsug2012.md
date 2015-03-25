# Dates and Location #
  * Friday, August 31, 2012, Vooruit
  * Saturday, September 1, 2012, 2River offices
  * Sunday, September 2, 2012, Vooruit

# Attendees #
  * Adriaan van Os
  * Dale Henrichs
  * Denis Defreyne
  * Diego Lont
  * Johan Brichau
  * John O'Keefe
  * Nick Ager
  * Philippe Marschall

# Ideas #
  * type conversion for Seaside-REST
  * port Seaisde-REST to VW
  * buffer recycling for Zinc
  * address scalability concerns in cache, see [Issue 262](https://code.google.com/p/seaside/issues/detail?id=262)
  * EventSource using continuations
  * jQuery UI using "new" file library
  * AJP
    * finish GemStone port
    * composite buffers (for request bodies)
    * read request body from buffer
    * read request URL from buffer
    * response streaming

# Work In Progress #
  * configurations for 3.1
  * investigate ways to make configurations easier to understand
  * port 3.1 to VA Smalltalk
  * port of Pier 3 to Gemstone

# Done #
  * add slime rule for unnecessary comma after last statement
  * reduce the number of false positives in the string concatenation rule
  * make Seaside-REST and WAApplication BFF
  * [Issue 716](https://code.google.com/p/seaside/issues/detail?id=716) in seaside: WARequestHandler>>#preferenceAt: has no corresponding WARequestHandler>>#preferenceAt: ifAbsent:
  * [Issue 735](https://code.google.com/p/seaside/issues/detail?id=735):	Problem with WAFileMetadataLibrary>>#deployFiles
  * [Issue 724](https://code.google.com/p/seaside/issues/detail?id=724):	add .pushState to ajaxifier
  * [Issue 697](https://code.google.com/p/seaside/issues/detail?id=697):    Within a WAComponent I've repeated implemented #children to return a collection that contains a reference to self. Causing infinite recursion