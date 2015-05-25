accessing-children
add: anElement
	children ifNil: [ children := OrderedCollection new ].
	children add: anElement