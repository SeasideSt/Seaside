Extension { #name : #Dictionary }

{ #category : #'*seaside-pharo20-core-backtracking' }
Dictionary >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-pharo20-core-backtracking' }
Dictionary >> snapshotCopy [
	^ self copy
]
