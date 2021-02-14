Extension { #name : #Object }

{ #category : #'*Seaside-Pharo-Core-backtracking' }
Object >> restoreFromSnapshot: anObject [
	self copyFrom: anObject
]

{ #category : #'*Seaside-Pharo-Core' }
Object >> snapshotCopy [
	^ self shallowCopy
]
