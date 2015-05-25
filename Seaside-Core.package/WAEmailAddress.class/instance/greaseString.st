displaying
greaseString
	^ String streamContents: [ :stream | 
		self 
			encodeOn: stream
			usingQuotes: true ]