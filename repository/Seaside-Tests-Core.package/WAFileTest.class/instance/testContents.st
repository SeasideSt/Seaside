tests
testContents
	file contents: #(83 101 97 115 105 100 101) asByteArray.
	self assert: file rawContents = #(83 101 97 115 105 100 101) asByteArray.
	self assert: (file contentsDecodedUsing: 'ISO-8859-1') = 'Seaside'
	
	