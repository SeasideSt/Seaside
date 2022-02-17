private
readHexFrom: aStream errorDetail: aString
	| hexChar |
	aStream atEnd ifTrue: [
		WAInvalidUrlSyntaxError signal: aString ].
	hexChar := aStream next.
	((hexChar between: $0 and: $9)
		or: [ (hexChar between: $a and: $f)
		or: [ hexChar between: $A and: $F ] ]) ifFalse: [ WAInvalidUrlSyntaxError signal: aString ].
	^ hexChar asUppercase digitValue