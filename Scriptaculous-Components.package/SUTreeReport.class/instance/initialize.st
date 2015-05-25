initialization
initialize
	super initialize.
	roots := OrderedCollection new.
	columns := OrderedCollection new.
	expanded := IdentitySet new.
	childrenBlock := [ :value | #() ].
	expandableBlock := [ :value | (childrenBlock value: value) notEmpty ]