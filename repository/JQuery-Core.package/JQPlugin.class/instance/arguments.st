accessing
arguments
	^ Array streamContents: [ :stream |
		self argumentsDo: [ :each |
			stream nextPut: each ] ]