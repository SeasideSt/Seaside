*scriptaculous-core
javascriptOn: aStream
	aStream nextPut: $[; javascript: self x; nextPut: $,; javascript: self y; nextPut: $]