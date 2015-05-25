testing
testEventsInKnownEvents
	"Test that any event on WATagBrush is in WAPrettyPrintedDocument >> #knownEvents"
	| selectors eventNames knownEvents |
	selectors :=  WATagBrush selectors select: [ :each |
		(each beginsWithSubCollection: #on)
			and: [ each ~= #onEnter: ] ].
	eventNames := selectors collect: [ :each |
		each = #onDoubleClick:
			ifTrue: [ 'ondblclick' ]
			ifFalse: [ each allButLast asLowercase ] ].
	knownEvents := WAPrettyPrintedDocument basicNew knownEvents.
	eventNames do: [ :each |
		self assert: (knownEvents includes: each) ]