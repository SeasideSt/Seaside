code generation
tag
	"WASelectTag tag"
	"WAGenericTag tag"

	^ (self selectors includes: #tag)
		ifTrue: [ self new tag ]
		ifFalse: [ nil ]