Extension { #name : #Object }

{ #category : #'*seaside-pharo20-core-backtracking' }
Object >> restoreFromSnapshot: anObject [
	self copyFrom: anObject
]

{ #category : #'*seaside-pharo20-core-backtracking' }
Object >> snapshotCopy [
	^ self shallowCopy
]
