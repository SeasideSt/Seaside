Extension { #name : #OrderedCollection }

{ #category : #'*Seaside-Pharo-Core' }
OrderedCollection >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*Seaside-Pharo-Core' }
OrderedCollection >> snapshotCopy [
	^ self copy
]
