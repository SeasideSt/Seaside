accessing
visibleComponentsFor: aCollection
	^ (aCollection select: [ :each | each isComponent ]) collect: [ :each | each body ]