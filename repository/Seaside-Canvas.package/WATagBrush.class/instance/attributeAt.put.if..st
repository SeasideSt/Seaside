accessing-attributes
attributeAt: aKey put: aValue if: aBoolean

	^ aBoolean ifTrue:[ self attributes at: aKey put: aValue ]