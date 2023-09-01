tests-invalid
testSurrogatePairs
	"Tests the handling of \uXXXX\uXXXX sequences that form surrogate pairs
	(see: https://www.rfc-editor.org/rfc/rfc8259#section-7)."

	self assert: (WAJsonParser parse: '"\uD800\uDC00"') equals: (String with: (Character codePoint: 16r10000)).
	self assert: (WAJsonParser parse: '"\uD834\uDD1E"') equals: (String with: (Character codePoint: 16r1D11E)).
	self assert: (WAJsonParser parse: '"\uDBFF\uDFFF"') equals: (String with: (Character codePoint: 16r10FFFF)).
	self assert: (WAJsonParser parse: '"\uD7FF\uD800\uDC00\uE000"') equals:
		(String with: (Character codePoint: 16rD7FF) with: (Character codePoint: 16r10000) with: (Character codePoint: 16rE000)).

	self should: [ WAJsonParser parse: '"\uD800"' ] raise: WAJsonSyntaxError.
	self should: [ WAJsonParser parse: '"\uDEAD"' ] raise: WAJsonSyntaxError.
	self should: [ WAJsonParser parse: '"\uDBFF"' ] raise: WAJsonSyntaxError.
	self should: [ WAJsonParser parse: '"\uDC00"' ] raise: WAJsonSyntaxError.
	self should: [ WAJsonParser parse: '"\uDFFF"' ] raise: WAJsonSyntaxError.
	self should: [ WAJsonParser parse: '"\uD800\uDBFF"' ] raise: WAJsonSyntaxError.
	self should: [ WAJsonParser parse: '"\uD800\uE000"' ] raise: WAJsonSyntaxError.
	self should: [ WAJsonParser parse: '"\uD800\DC00"' ] raise: WAJsonSyntaxError.
	self should: [ WAJsonParser parse: '"\uD800DC00"' ] raise: WAJsonSyntaxError.

