Extension { #name : #Object }

{ #category : #'*seaside-pharo-core-backtracking' }
Object >> restoreFromSnapshot: anObject [
	self copyFrom: anObject
]

{ #category : #'*seaside-pharo-core-backtracking' }
Object >> snapshotCopy [
	^ self shallowCopy
]
