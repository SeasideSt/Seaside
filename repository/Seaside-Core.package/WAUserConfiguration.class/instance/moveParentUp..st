ancestry
moveParentUp: aConfiguration 
	| index |
	self clearSearchContexts.
	index := parents indexOf: aConfiguration ifAbsent: [ ^ self ].
	index > 1 ifTrue: [ parents swap: index with: index - 1 ]