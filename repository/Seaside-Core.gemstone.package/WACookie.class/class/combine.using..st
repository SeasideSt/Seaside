convenience
combine: aCollectionOfCookies using: aOneArgumentBlock
	"combines several cookies into one HTTP header line
	aOneArgumentBlock takes a cookie as an argument and returns a string,
	it is supposed to send one of #oldNetscapeString #rfc2109String #rfc2965String to the argument"
	^ String streamContents: [ :stream |
		aCollectionOfCookies
			do: [ :each |
				stream nextPutAll: (aOneArgumentBlock value: each) ]
			separatedBy: [ stream nextPutAll: ', ' ] ]