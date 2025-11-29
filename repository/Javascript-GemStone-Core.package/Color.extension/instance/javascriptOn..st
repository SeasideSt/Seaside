*javascript-gemstone-core
javascriptOn: aRenderer

	aRenderer string: (String streamContents: [ :stream |
		nextPut: $#.
		stream nextPutAll: (((self red * 255) truncated printStringBase: 16)
			padded: #left to: 2 with: $0).
		stream nextPutAll: (((self green * 255) truncated printStringBase: 16)
			padded: #left to: 2 with: $0).
		stream nextPutAll: (((self blue * 255) truncated printStringBase: 16)
			padded: #left to: 2 with: $0) ])