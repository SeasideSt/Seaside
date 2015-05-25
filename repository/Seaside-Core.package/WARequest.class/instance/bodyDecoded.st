accessing-body
bodyDecoded
	"Answer the body decoded using the character set in the request header. Answer nil if no body is present. Signal an error if not character set is present in the request header."
	| contentType charSet |
	contentType := self contentType.
	charSet := contentType isNil ifFalse: [ contentType charSet ].
	^ charSet isNil
		ifTrue: [ WAIllegalStateException signal: 'no character set of request body can not be determined' ]
		ifFalse: [ self bodyDecodeUsing: charSet ]