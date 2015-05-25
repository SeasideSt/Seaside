private
convertToInteger: aString max: maxValue 
	| anInteger |
	anInteger := aString greaseInteger.
	anInteger isNil ifTrue: [ ^ 0 ].
	^ (anInteger max: 0) min: maxValue