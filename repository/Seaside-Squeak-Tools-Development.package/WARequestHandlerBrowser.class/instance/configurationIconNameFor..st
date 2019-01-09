configuration - attributes
configurationIconNameFor: aWAAtrribute

	(self configuration hasExpressionAt: aWAAtrribute key)
		ifTrue: [^ #arrowUp].
	^ #blank
