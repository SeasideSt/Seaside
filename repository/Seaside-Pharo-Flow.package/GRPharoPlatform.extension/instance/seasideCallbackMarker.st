*seaside-pharo-flow
seasideCallbackMarker
	| context |
	context := thisContext sender.
	[ context isNil or: [ (context receiver isKindOf: WACallback) or: [ context method == (WATaskVisitor >> #visitTask:) ] ] ]
		whileFalse: [ context := context sender ].
	context isNil
		ifTrue: [ self error: 'You can only #call: and #answer: from within a callback or a Task.' ].
	^ context