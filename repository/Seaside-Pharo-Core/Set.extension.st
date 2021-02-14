Extension { #name : #Set }

{ #category : #'*Seaside-Pharo-Core' }
Set >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*Seaside-Pharo-Core' }
Set >> snapshotCopy [
	^ self copy
]
