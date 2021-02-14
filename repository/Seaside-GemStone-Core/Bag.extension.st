Extension { #name : #Bag }

{ #category : #'*seaside-gemstone-core' }
Bag >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-gemstone-core' }
Bag >> snapshotCopy [
	^ self copy
]
