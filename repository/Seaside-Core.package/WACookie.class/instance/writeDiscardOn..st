writing-private
writeDiscardOn: aStream
	(self discard notNil and: [ self discard ])
		ifTrue: [ aStream nextPutAll: '; Discard' ]