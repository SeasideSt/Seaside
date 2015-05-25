private
privatePathParameterMapAt: anIndex
	pathParameters isNil ifTrue: [
		pathParameters := OrderedCollection new: self path size ].
	^ pathParameters size >= anIndex
		ifTrue: [ pathParameters at: anIndex ]
		ifFalse: [
			anIndex - pathParameters size - 1 timesRepeat: [
				pathParameters add: nil ].
			pathParameters add: GROrderedMultiMap new ]