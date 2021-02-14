Extension { #name : #OrderedDictionary }

{ #category : #'*Seaside-Pharo-Core' }
OrderedDictionary >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*Seaside-Pharo-Core' }
OrderedDictionary >> snapshotCopy [
	^ self copy
]
