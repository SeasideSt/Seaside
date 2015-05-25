convenience
withLineBreaksAndUrls: aString
	| stream |
	aString ifNil: [ ^ self ].
	stream := aString readStream.
	[ stream atEnd ] whileFalse: [ 
		self withUrls: stream nextLine.
		stream atEnd
			ifFalse: [ self break ] ]