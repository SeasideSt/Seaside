Extension { #name : #OrderedCollection }

{ #category : #'*Seaside-Squeak-Core' }
OrderedCollection >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*Seaside-Squeak-Core' }
OrderedCollection >> snapshotCopy [
	^ self copy
]
