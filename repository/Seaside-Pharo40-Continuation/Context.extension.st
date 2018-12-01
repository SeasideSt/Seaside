Extension { #name : #Context }

{ #category : #'*seaside-pharo40-continuation' }
Context >> localAt: aNumber [
	^ self at: aNumber
]

{ #category : #'*seaside-pharo40-continuation' }
Context >> localAt: aNumber put: anObject [
	^ self at: aNumber put: anObject
]

{ #category : #'*seaside-pharo40-continuation' }
Context >> localSize [
	^ self size
]

{ #category : #'*seaside-pharo40-continuation' }
Context >> serialiseOn: aStream [
	aStream nextPut: self.
	1 to: self class instSize do: [ :index |
		aStream nextPut: (self instVarAt: index) ].
	1 to: self localSize do: [ :index |
		aStream nextPut: (self localAt: index) ]
]
