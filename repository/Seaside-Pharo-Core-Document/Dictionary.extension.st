Extension { #name : #Dictionary }

{ #category : #'*seaside-pharo-core-backtracking' }
Dictionary >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-pharo-core-backtracking' }
Dictionary >> snapshotCopy [
	^ self copy
]
