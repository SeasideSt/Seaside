accessing-children
childrenDo: aBlock
	children isNil
		ifFalse: [ children do: aBlock ]