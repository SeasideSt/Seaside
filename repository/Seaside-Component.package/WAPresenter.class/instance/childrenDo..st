iterating
childrenDo: aBlock
	self children do: [ :each | 
		each == self ifTrue: [
			"fix for http://code.google.com/p/seaside/issues/detail?id=697"
			WAChildComponentShouldNotBeSelfError 
				signal: self class name greaseString, ' >> #children - the returned collection contains a reference to self. Exception raised to avoid infinite recursion.' ].
		each isNil
			ifFalse: [ aBlock value: each ] ]