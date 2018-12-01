Extension { #name : #WriteStream }

{ #category : #'*loadordertests' }
WriteStream >> show: aString [

	^self nextPutAll: aString.
	
]
