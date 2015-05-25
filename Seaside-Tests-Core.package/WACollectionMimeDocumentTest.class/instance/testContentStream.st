tests
testContentStream
	| stream |	
	stream := document contentStream.
	'aString' do: [ :each |
		self deny: stream atEnd.
		self assert: stream next = each ].
	
	self assert: stream atEnd