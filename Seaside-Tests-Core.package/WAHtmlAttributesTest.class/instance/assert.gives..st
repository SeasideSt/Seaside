private
assert: aBlock gives: aString 
	| stream |
	aBlock value: (attributes := WAHtmlAttributes new).
	(WAHtmlDocument 
		on: (stream := WriteStream on: String new)
		codec: self requestContext codec) print: attributes.
	self 
		assert: stream contents = aString
		description: 'Expected ' , aString printString , ', but got ' , stream contents printString
		resumable: true