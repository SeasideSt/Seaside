private
childrenOf: anObject
	^ Array streamContents: [ :stream |
		tree do: [ :each |
			each key = anObject
				ifTrue: [ stream nextPut: each value ] ] ]