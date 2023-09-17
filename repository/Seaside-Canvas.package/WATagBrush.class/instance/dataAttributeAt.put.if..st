attributes
dataAttributeAt: aString put: aValue if: aBoolean

	aBoolean ifTrue:[ self dataAttributeAt: aString put: aValue ]