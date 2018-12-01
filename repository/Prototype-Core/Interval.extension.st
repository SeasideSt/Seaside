Extension { #name : #Interval }

{ #category : #'*prototype-core' }
Interval >> javascriptOn: aStream [
	aStream nextPutAll: '$R('; javascript: self first; nextPut: $,; javascript: self last; nextPut: $)
]
