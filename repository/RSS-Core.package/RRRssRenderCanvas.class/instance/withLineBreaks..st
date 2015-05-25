convenience
withLineBreaks: aString
	aString isEmptyOrNil
		ifTrue: [ ^ self ].
	self renderHtml: [ :html | html withLineBreaks: aString ]