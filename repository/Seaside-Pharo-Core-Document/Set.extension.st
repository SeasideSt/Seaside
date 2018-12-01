Extension { #name : #Set }

{ #category : #'*seaside-pharo-core-backtracking' }
Set >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-pharo-core-backtracking' }
Set >> snapshotCopy [
	^ self copy
]
