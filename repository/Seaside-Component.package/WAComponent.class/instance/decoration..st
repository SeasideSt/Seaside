accessing
decoration: aDecoration
	decoration isNil ifTrue: [ 
		decoration := WAValueHolder with: self ].
	decoration contents: aDecoration