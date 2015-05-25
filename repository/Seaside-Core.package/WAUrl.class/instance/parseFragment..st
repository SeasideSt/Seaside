parsing
parseFragment: aString
	aString isEmpty ifTrue: [ ^ self ].
	self fragment: (self decode: aString)