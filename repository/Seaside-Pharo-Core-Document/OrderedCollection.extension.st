Extension { #name : #OrderedCollection }

{ #category : #'*seaside-pharo-core-backtracking' }
OrderedCollection >> restoreFromSnapshot: anObject [
	super restoreFromSnapshot: anObject snapshotCopy
]

{ #category : #'*seaside-pharo-core-backtracking' }
OrderedCollection >> snapshotCopy [
	^ self copy
]
