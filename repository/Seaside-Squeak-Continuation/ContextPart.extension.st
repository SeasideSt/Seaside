Extension { #name : #ContextPart }

{ #category : #'*Seaside-Squeak-Continuation' }
ContextPart >> localAt: aNumber [
	^ self at: aNumber
]

{ #category : #'*Seaside-Squeak-Continuation' }
ContextPart >> localAt: aNumber put: anObject [
	^ self at: aNumber put: anObject
]

{ #category : #'*Seaside-Squeak-Continuation' }
ContextPart >> localSize [
	^ self size
]

{ #category : #'*Seaside-Squeak-Continuation' }
ContextPart >> serialiseOn: aStream [
	aStream nextPut: self.
	1 to: self class instSize do: [ :index |
		aStream nextPut: (self instVarAt: index) ].
	1 to: self localSize do: [ :index |
		aStream nextPut: (self localAt: index) ].
]
