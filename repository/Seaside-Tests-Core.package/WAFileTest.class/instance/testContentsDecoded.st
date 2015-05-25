tests
testContentsDecoded
	file contents: #(83 101 97 115 105 100 101) asByteArray.
	self should: [ file contentsDecoded ] raise: WAIllegalStateException.
	file contentType: 'text/plain'.
	self should: [ file contentsDecoded ] raise: WAIllegalStateException.
	file contentType: 'text/plain; charset=iso-8859-1' seasideMimeType.
	self assert: file contentsDecoded = 'Seaside'
	
	