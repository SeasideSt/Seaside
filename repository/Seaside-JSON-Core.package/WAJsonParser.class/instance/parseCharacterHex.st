parsing-internal
parseCharacterHex
	| value |
	value := self parseCharacterHexRaw.
	(self isHighSurrogate: value) ifTrue: [
		| lowSurrogate |
		self expectChar: $\.
		self expectChar: $u.
		lowSurrogate := self parseCharacterHexRaw.
		(self isLowSurrogate: lowSurrogate) ifFalse: [
			^ self error: 'low surrogate expected' ].
		value := 16r10000 +
			((value - 16rD800 bitShift: 10)
			bitOr: (lowSurrogate - 16rDC00)) ].
	^ Character codePoint: value