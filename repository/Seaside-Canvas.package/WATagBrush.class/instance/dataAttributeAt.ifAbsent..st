accessing-attributes
dataAttributeAt: aString ifAbsent: aBlock

	^ self attributes at: 'data-',aString ifAbsent: aBlock