tests
testContents
	file contents: #(83 195 169 195 164 115 195 174 100 195 169) asByteArray.
	self assert: file rawContents = #(83 195 169 195 164 115 195 174 100 195 169) asByteArray.
	self assert: (file contentsDecodedUsing: 'ISO-8859-1') = self brokenUnicodeString.
	self assert: (file contentsDecodedUsing: 'UTF-8') = self unicodeString