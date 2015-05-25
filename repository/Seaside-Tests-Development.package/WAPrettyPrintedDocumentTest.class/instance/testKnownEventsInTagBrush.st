testing
testKnownEventsInTagBrush
	"Test that any event in WAPrettyPrintedDocument >> #knownEvents is on WATagBrush"
	| knownEvents |
	knownEvents := WAPrettyPrintedDocument basicNew knownEvents.
	knownEvents do: [ :each |
		| selector |
		selector := each = 'ondblclick'
			ifTrue: [ #onDoubleClick: ]
			ifFalse: [
				WATagBrush selectors detect: [ :eachSelector |
				eachSelector allButLast asLowercase greaseString = each ] ].
		self assert: selector notNil ]