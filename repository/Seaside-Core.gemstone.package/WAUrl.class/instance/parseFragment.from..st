parsing
parseFragment: aString from: startIndex
	startIndex > aString size ifTrue: [ ^ self ].
	self fragment: (self class decodePercent: aString from: startIndex)