helper
allSelectors
	^ (class class selectors select: [ :each | each beginsWithSubCollection: self selectorPrefix ]) sorted