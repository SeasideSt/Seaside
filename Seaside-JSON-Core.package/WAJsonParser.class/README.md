I am a parser for JSON. It is a bit more forgiving than the standard and allows any kind of top level element except numbers, not just {} and []. See http://www.json.org/ for details.

I can be subclasses to create more sophisticated objects than just Arrays and Dictionaries. To do that, override the one or more methods in the creating protocol.