*seaside-widgets-decorations
validateWith: aBlock
	^ self addDecoration: (WAValidationDecoration new validateWith: aBlock)