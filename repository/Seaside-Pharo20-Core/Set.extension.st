Extension { #name : #Set }

{ #category : #'*seaside-pharo20-core-backtracking' }
Set >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-pharo20-core-backtracking' }
Set >> snapshotCopy [
	^ self copy
]
