Extension { #name : #Interval }

{ #category : #'*Prototype-Core' }
Interval >> javascriptOn: aStream [
	aStream nextPutAll: '$R('; javascript: self first; nextPut: $,; javascript: self last; nextPut: $)
]
