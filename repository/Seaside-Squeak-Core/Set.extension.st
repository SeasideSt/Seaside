Extension { #name : #Set }

{ #category : #'*Seaside-Squeak-Core' }
Set >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*Seaside-Squeak-Core' }
Set >> snapshotCopy [
	^ self copy
]
