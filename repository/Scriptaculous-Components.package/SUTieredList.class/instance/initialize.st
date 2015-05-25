initialization
initialize
	super initialize.
	selectionPath := OrderedCollection new.
	childrenBlock := [ :value | #() ].
	labelBlock := [ :value | value printString ]