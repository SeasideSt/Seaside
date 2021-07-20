decoding
decodePercent: aString from: start to: end
	"percent decodes the string starting at the given index"
	| input output index left |
	index := aString indexOf: $% startingAt: start.
	(index = 0 or: [ index >= end ])
		ifTrue: [ ^ aString copyFrom: start to: end - 1 ].
	input := aString readStream.
	input skip: start - 1. "start index 1 -> skip 0"
	output := WriteStream on: (String new: aString size).
	left := end - start.
	[ left > 0 and: [ input atEnd not ] ] whileTrue: [
		| char |
		char := input next.
		output nextPut: (char = $%
			ifTrue: [
				| firstByte secondByte |
				firstByte :=  self readHexFrom: input errorDetail: aString.
				secondByte :=  self readHexFrom: input errorDetail: aString.
				left := left - 3.
				Character codePoint:firstByte * 16 + secondByte ]
			ifFalse: [
				left := left - 1.
				char ]) ].
	^ output contents