private
fieldsFromURI: aFSResponderRole

	| string i |
	string := aFSResponderRole params at: 'REQUEST_URI'.
	i := string 
		indexOf: $?
		startingAt: 1
		ifAbsent: [^''].
	string := string copyFrom: i + 1 to: string size.
	^string.