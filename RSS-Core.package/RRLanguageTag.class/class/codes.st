accessing
codes
	^ Array streamContents: [ :stream |
		self codesString lines do: [ :line |
			stream nextPut: (Array
				with: (line copyUpTo: Character tab) asLegalSelector
				with: (line copyAfter: Character tab)) ] ]