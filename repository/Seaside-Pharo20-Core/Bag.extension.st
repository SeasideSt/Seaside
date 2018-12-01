Extension { #name : #Bag }

{ #category : #'*seaside-pharo20-core-backtracking' }
Bag >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-pharo20-core-backtracking' }
Bag >> snapshotCopy [
	^ self copy
]
