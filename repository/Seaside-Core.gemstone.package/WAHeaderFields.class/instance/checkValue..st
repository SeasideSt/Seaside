private
checkValue: aValue
	(aValue isString and: [
		(aValue indexOf: Character cr) ~= 0
			or: [ (aValue indexOf: Character lf) ~= 0 ] ]) ifTrue: [
				WAInvalidHeaderValueError signal: 'invalid header value', aValue "we know this is a String now" ]