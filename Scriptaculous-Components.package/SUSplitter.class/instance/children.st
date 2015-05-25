hooks
children
	^ (items select: [ :each | each isComponent ]) collect: [ :each | each body ]