Extension { #name : #WAPresenterGuide }

{ #category : #'*seaside-development' }
WAPresenterGuide >> addHaloVisitor: aHaloVisitor [
	client := client addHaloVisitor: aHaloVisitor.
	^ self
]
