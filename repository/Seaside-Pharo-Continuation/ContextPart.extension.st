Extension { #name : #ContextPart }

{ #category : #'*seaside-pharo-continuation' }
ContextPart >> localAt: aNumber [
	^ self at: aNumber
]

{ #category : #'*seaside-pharo-continuation' }
ContextPart >> localAt: aNumber put: anObject [
	^ self at: aNumber put: anObject
]

{ #category : #'*seaside-pharo-continuation' }
ContextPart >> localSize [
	^ self size
]

{ #category : #'*seaside-pharo-continuation' }
ContextPart >> serialiseOn: aStream [
	aStream nextPut: self.
	1 to: self class instSize do: [ :index |
		aStream nextPut: (self instVarAt: index) ].
	1 to: self localSize do: [ :index |
		aStream nextPut: (self localAt: index) ].
]
