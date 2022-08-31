I am a parser for JSON. I follow RFC-8259 / ECMA-404 and allow any kind of value as a root object.

I convert surrogate pairs to a single code point.

I can be subclassed to create more sophisticated objects than just Arrays and Dictionaries. To do that, override the one or more methods in the "creating" protocol.

See
https://datatracker.ietf.org/doc/html/rfc8259
https://www.ecma-international.org/publications-and-standards/standards/ecma-404/
https://datatracker.ietf.org/doc/html/rfc4627