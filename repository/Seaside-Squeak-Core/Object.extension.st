Extension { #name : #Object }

{ #category : #'*Seaside-Squeak-Core' }
Object >> restoreFromSnapshot: anObject [
	self copyFrom: anObject
]

{ #category : #'*Seaside-Squeak-Core' }
Object >> snapshotCopy [
	^ self shallowCopy
]
