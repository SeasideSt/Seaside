*seaside-gemstone-flow
seasideSuspendFlowDo: aBlock
	| marker |
	(marker := self callbackMarker) == nil
		ifTrue: [ ^WAGsInvalidCallbackContext signal: 'You can only #call: and #answer: from within a callback or a Task.' ].
	^aBlock value: (WAPartialContinuation to: marker offset: 0 markerBlock: [ self callbackMarker ])