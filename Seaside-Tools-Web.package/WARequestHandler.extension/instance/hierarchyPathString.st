*seaside-tools-web
hierarchyPathString
	^ String streamContents: [ :stream |
		stream nextPut: $/.
		self hierarchyNames
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream nextPut: $/ ] ]