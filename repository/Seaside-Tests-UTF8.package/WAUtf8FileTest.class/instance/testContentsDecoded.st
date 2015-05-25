tests
testContentsDecoded
	file contents:  #(83 195 169 195 164 115 195 174 100 195 169) asByteArray.
	self should: [ file contentsDecoded ] raise: WAIllegalStateException.
	file contentType: 'text/plain'.
	self should: [ file contentsDecoded ] raise: WAIllegalStateException.
	file contentType: 'text/plain; charset=utf-8' seasideMimeType.
	self assert: file contentsDecoded = self unicodeString
	