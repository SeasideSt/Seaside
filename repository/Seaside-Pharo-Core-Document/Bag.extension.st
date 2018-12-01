Extension { #name : #Bag }

{ #category : #'*seaside-pharo-core-backtracking' }
Bag >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-pharo-core-backtracking' }
Bag >> snapshotCopy [
	^ self copy
]
