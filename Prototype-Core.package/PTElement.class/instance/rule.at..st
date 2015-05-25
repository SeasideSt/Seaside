private
rule: aString at: anInteger
	^ Array streamContents: [ :stream |
		(aString isNil or: [ aString isEmpty ])
			ifFalse: [ stream nextPut: aString ].
		(anInteger isNil or: [ anInteger isZero ])
			ifFalse: [ stream nextPut: anInteger ] ]