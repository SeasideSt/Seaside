Extension { #name : 'WARenderContext' }

{ #category : '*Seaside-HotwireTurbo-Core' }
WARenderContext >> visitor: aVisitor during: aBlock [
	"Set the value of visitor for the duration of aBlock"
	| previous |
	previous := visitor.
	[ visitor := aVisitor.
	aBlock value ]
		ensure: [ visitor := previous ]

]
