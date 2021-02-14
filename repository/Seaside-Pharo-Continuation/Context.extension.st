Extension { #name : #Context }

{ #category : #'*Seaside-Pharo-Continuation' }
Context >> localAt: aNumber [
	^ self at: aNumber
]

{ #category : #'*Seaside-Pharo-Continuation' }
Context >> localAt: aNumber put: anObject [
	^ self at: aNumber put: anObject
]

{ #category : #'*Seaside-Pharo-Continuation' }
Context >> localSize [
	^ self size
]

{ #category : #'*Seaside-Pharo-Continuation' }
Context >> serialiseOn: aStream [
	aStream nextPut: self.
	1 to: self class instSize do: [ :index |
		aStream nextPut: (self instVarAt: index) ].
	1 to: self localSize do: [ :index |
		aStream nextPut: (self localAt: index) ]
]
