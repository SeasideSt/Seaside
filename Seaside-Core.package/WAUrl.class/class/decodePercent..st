decoding
decodePercent: aString
	"percent decodes the given String"
	| input output char |
	input := aString readStream.
	output := WriteStream on: (String new: aString size).
	[ input atEnd ] whileFalse: [
		char := input next.
		output nextPut: (char = $+
			ifTrue: [ Character space ]
			ifFalse: [
				char = $%
					ifTrue: [
						| firstByte secondByte |
						firstByte :=  input atEnd ifTrue: [ WAInvalidUrlSyntaxError signal: aString ] ifFalse: [ input next asUppercase digitValue ].
						secondByte :=  input atEnd ifTrue: [ WAInvalidUrlSyntaxError signal: aString ] ifFalse: [ input next asUppercase digitValue ].
						Character codePoint:firstByte * 16 + secondByte ]
					ifFalse: [ char ] ]) ].
	^ output contents