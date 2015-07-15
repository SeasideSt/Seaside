private
percentDecode: aString

	| results input space |
	input := ReadStream on: aString.
	results := WriteStream on: String new.
	space := Character space.
	[ input atEnd ] whileFalse: 
		[ | char |
		char := input next asCharacter.
		results nextPut: (char = $+ 
			ifTrue: [ space ]
			ifFalse: 
				[char == $% 
					ifTrue: [ 
						[ Character codePoint: input next asUppercase digitValue * 16
							+ input next asUppercase digitValue ] 
							on: Error 
							do: [:ex | Character codePoint: 0 ]]
					ifFalse: [ char ]]) ].
	^results contents