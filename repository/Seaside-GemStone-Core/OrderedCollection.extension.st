Extension { #name : #OrderedCollection }

{ #category : #'*seaside-gemstone-core' }
OrderedCollection >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-gemstone-core' }
OrderedCollection >> snapshotCopy [
	^ self copy
]
