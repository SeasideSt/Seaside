Extension { #name : #Dictionary }

{ #category : #'*Seaside-Pharo-Core' }
Dictionary >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*Seaside-Pharo-Core' }
Dictionary >> snapshotCopy [
	^ self copy
]
