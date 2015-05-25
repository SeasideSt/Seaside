accessing
contentsDecoded
	"Answer the contents decoded using the character set in the part header. Signal an error if not character set is present in the part header."
	| type charSet |
	type := self contentType.
	charSet := type isNil ifFalse: [ type charSet ].
	^ charSet isNil
		ifTrue: [ WAIllegalStateException signal: 'no character set of file upload can not be determined' ]
		ifFalse: [ self contentsDecodedUsing: charSet ]