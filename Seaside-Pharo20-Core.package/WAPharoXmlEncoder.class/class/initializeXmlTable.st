class initialization
initializeXmlTable
	table := ByteArray new: 256.
	1 to: 256 do: [ :index |
		('"<&>' includes: (Character codePoint: index - 1))
			ifTrue: [ table at: index put: 1 ]
			ifFalse: [ table at: index put: 0 ] ]