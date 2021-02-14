Extension { #name : #Bag }

{ #category : #'*Seaside-Squeak-Core' }
Bag >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*Seaside-Squeak-Core' }
Bag >> snapshotCopy [
	^ self copy
]
