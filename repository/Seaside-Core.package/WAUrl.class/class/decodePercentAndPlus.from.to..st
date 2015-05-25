decoding
decodePercentAndPlus: aString from: start to: end
	"percent decodes the given String"
	| percentIndex input output left |
	"check if we contain %"
	percentIndex := aString indexOf: $% startingAt: start.
	(percentIndex = 0 or: [ percentIndex >= end ]) ifTrue: [
		| plusIndex |
		"check if we contain +"
		plusIndex := aString indexOf: $+ startingAt: start.
		(plusIndex = 0 or: [ plusIndex >= end ]) ifTrue: [
			^ aString copyFrom: start to: end - 1 ] ].
	
	"we contain either % or +"
	input := aString readStream.
	input skip: start - 1. "start index 1 -> skip 0"
	output := WriteStream on: (String new: aString size).
	left := end - start.
	[ left > 0 and: [ input atEnd not ] ] whileTrue: [
		| char |
		char := input next.
		output nextPut: (char = $+
			ifTrue: [
				left := left - 1.
				Character space ]
			ifFalse: [
				char = $%
					ifTrue: [
						| firstByte secondByte |
						firstByte :=  input atEnd ifTrue: [ WAInvalidUrlSyntaxError signal: aString ] ifFalse: [ input next asUppercase digitValue ].
						secondByte :=  input atEnd ifTrue: [ WAInvalidUrlSyntaxError signal: aString ] ifFalse: [ input next asUppercase digitValue ].
						left := left - 3.
						Character codePoint:firstByte * 16 + secondByte ]
					ifFalse: [
						left := left - 1.
						char ] ]) ].
	^ output contents