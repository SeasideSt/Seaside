Extension { #name : #WAPainterVisitor }

{ #category : #'*seaside-development' }
WAPainterVisitor >> addHaloVisitor: aHaloVisitor [
	^ aHaloVisitor
		visitor: self;
		yourself
]
