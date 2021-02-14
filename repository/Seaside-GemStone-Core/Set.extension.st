Extension { #name : #Set }

{ #category : #'*seaside-gemstone-core' }
Set >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-gemstone-core' }
Set >> snapshotCopy [
	^ self copy
]
