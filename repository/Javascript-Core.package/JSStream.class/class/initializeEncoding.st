initialization
initializeEncoding
	| printer escapes |
	printer := GRNumberPrinter new.
	printer base: 16; padding: $0; digits: 2.
	JavascriptCharacters := Array new: 128.
	0 to: 31 do: [ :index | 
		JavascriptCharacters 
			at: index + 1
			put: '\x' , (printer print: index) ].
	escapes := #( 0 '\0' 7 '\a' 8 '\b' 9 '\t' 10 '\n' 12 '\f' 13 '\r' 34 '\"' 92 '\\' ).
	1 to: escapes size - 1 by: 2 do: [ :index | 
		JavascriptCharacters 
			at: (escapes at: index) + 1
			put: (escapes at: index + 1) ]