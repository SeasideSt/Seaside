testing
isVisible
	"Hide the test in closure images."

	Smalltalk globals at: 'BlockContext' ifPresent: [ :blockContext |
		[ ] isKindOf: blockContext ].
	^ false