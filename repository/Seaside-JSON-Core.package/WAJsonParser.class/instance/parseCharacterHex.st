parsing-internal
parseCharacterHex
	| value |
	value := self parseCharacterHexRaw.
	(self isHighSurrogate: value)
		ifTrue: [
			| lowSurrogate |
			self expectChar: $\.
			self expectChar: $u.
			lowSurrogate := self parseCharacterHexRaw.
			(self isLowSurrogate: lowSurrogate) ifFalse: [
				^ self error: 'low surrogate expected' ].
			value := self createCodePointFromSurrogatesHigh: value low: lowSurrogate ]
		ifFalse: [
			(self isLowSurrogate: value)
				ifTrue: [ self error: 'unexpected low surrogate' ] ].
	^ Character codePoint: value