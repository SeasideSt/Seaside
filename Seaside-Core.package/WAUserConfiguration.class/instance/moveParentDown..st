ancestry
moveParentDown: aConfiguration 
	| index |
	self clearSearchContexts.
	index := parents indexOf: aConfiguration ifAbsent: [ ^ self ].
	index < parents size ifTrue: [ parents swap: index with: index + 1 ]