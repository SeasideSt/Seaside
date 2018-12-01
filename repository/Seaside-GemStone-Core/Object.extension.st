Extension { #name : #Object }

{ #category : #'*Seaside-GemStone-Core' }
Object >> restoreFromSnapshot: anObject [
	"Default implementation : restore from a shallow copy"
	| class |
	class := self class.
	1 to: class instSize do:
		[:i | self instVarAt: i put: (anObject instVarAt: i) ].
	class isVariable
		ifTrue:
			[class isIndexable ifFalse: [self error: 'not indexable: ', class printString].
			self basicSize ~= anObject basicSize 
				ifTrue: [ self size: anObject basicSize - class instSize ].
			1 to: self basicSize - class instSize do:
				[:i | self basicAt: i put: (anObject basicAt: i) ]].
]

{ #category : #'*Seaside-GemStone-Core' }
Object >> snapshotCopy [
	^ self shallowCopy
]
