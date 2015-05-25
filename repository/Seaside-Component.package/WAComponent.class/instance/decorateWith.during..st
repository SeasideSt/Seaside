decorations
decorateWith: aDecoration during: aBlock
	"Decorate the receiver with aDecoration during the execution of aBlock."

	| result |
	self addDecoration: aDecoration.
	result := aBlock value.
	self removeDecoration: aDecoration.
	^ result