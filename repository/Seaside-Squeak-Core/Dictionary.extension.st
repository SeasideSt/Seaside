Extension { #name : #Dictionary }

{ #category : #'*Seaside-Squeak-Core' }
Dictionary >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*Seaside-Squeak-Core' }
Dictionary >> snapshotCopy [
	^ self copy
]
