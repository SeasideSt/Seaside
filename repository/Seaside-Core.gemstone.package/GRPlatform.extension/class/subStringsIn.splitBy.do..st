*seaside-core
subStringsIn: aString splitBy: aCharacter do: aOneArgumentBlock
	"#subStrings: can be slow on Pharo because it uses a lot of allocation so we avoid it
	see issue Issue 609"
	| startIndex |
	startIndex := aString indexOf: aCharacter.
	startIndex = 0
		ifTrue: [
			aString isEmpty ifFalse: [
				aOneArgumentBlock value: aString ] ]
		ifFalse: [
			| endIndex stringSize |
			stringSize := aString size.
			startIndex = 1 ifFalse: [
				"case where we have a path not starting with aCharacter"
				aOneArgumentBlock value: (aString copyFrom: 1 to: startIndex - 1) ].
			endIndex := aString indexOf: aCharacter startingAt: startIndex + 1.
			[ startIndex ~= 0 ] whileTrue: [
				startIndex + 1 = endIndex
					ifTrue: [
						"skip, avoid adding empty strings"
						startIndex := endIndex.
						endIndex := aString indexOf: aCharacter startingAt: startIndex + 1 ]
					ifFalse: [
						endIndex = 0
							ifTrue: [
								startIndex < stringSize ifTrue: [
									"avoid adding empty path if aString ends with aCharacter"
									aOneArgumentBlock value: (aString copyFrom: startIndex + 1 to: stringSize) ].
								startIndex := 0 ]
							ifFalse: [
								aOneArgumentBlock value: (aString copyFrom: startIndex + 1 to: endIndex  - 1).
								startIndex := endIndex.
								endIndex := aString indexOf: aCharacter startingAt: startIndex + 1 ] ] ] ]