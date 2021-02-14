Extension { #name : #WAPainterVisitor }

{ #category : #'*seaside-component' }
WAPainterVisitor >> visitComponent: aComponent [
	self visitPresenter: aComponent
]

{ #category : #'*seaside-component' }
WAPainterVisitor >> visitDecoration: aDecoration [
	self visitPresenter: aDecoration
]

{ #category : #'*seaside-component' }
WAPainterVisitor >> visitDecorationsOfComponent: aComponent [
	aComponent decoration accept: self
]

{ #category : #'*seaside-component' }
WAPainterVisitor >> visitDelegation: aDelegation [
	self visitDecoration: aDelegation
]

{ #category : #'*seaside-component' }
WAPainterVisitor >> visitPresenter: aPresenter [
	self visitPainter: aPresenter
]
