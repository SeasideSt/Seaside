*Seaside-Widgets
validateWith: aBlock
	^ self addDecoration: (WAValidationDecoration new validateWith: aBlock)