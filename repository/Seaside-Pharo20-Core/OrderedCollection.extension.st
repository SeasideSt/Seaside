Extension { #name : #OrderedCollection }

{ #category : #'*seaside-pharo20-core-backtracking' }
OrderedCollection >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-pharo20-core-backtracking' }
OrderedCollection >> snapshotCopy [
	^ self copy
]
