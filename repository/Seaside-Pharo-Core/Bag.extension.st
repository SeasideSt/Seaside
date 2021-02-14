Extension { #name : #Bag }

{ #category : #'*Seaside-Pharo-Core' }
Bag >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*Seaside-Pharo-Core' }
Bag >> snapshotCopy [
	^ self copy
]
