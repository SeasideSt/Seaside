convenience
withUrls: aString 
	| stream url |
	stream := aString readStream.
	[ stream atEnd ] whileFalse: 
		[ self text: (stream greaseUpToAll: 'http://').
		stream atEnd ifFalse: 
			[ url := 'http://' , (stream upTo: Character space).
			self anchor
				url: url;
				with: url.
			self text: ' ' ] ]