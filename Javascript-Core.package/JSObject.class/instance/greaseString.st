printing
greaseString
	^ String streamContents: [ :stream | stream javascript: self ]