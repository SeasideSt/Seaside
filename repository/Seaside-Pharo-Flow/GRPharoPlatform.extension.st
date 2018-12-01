Extension { #name : #GRPharoPlatform }

{ #category : #'*seaside-pharo-flow' }
GRPharoPlatform >> seasideCallbackMarker [
	| context |
	context := thisContext sender.
	[ context isNil or: [ (context receiver isKindOf: WACallback) or: [ context method == (WATaskVisitor >> #visitTask:) ] ] ]
		whileFalse: [ context := context sender ].
	context isNil
		ifTrue: [ self error: 'You can only #call: and #answer: from within a callback or a Task.' ].
	^ context
]

{ #category : #'*seaside-pharo-flow' }
GRPharoPlatform >> seasideSuspendFlowDo: aBlock [
	| continuation |
	continuation := WAPartialContinuation
		from: thisContext sender
		to: self seasideCallbackMarker.
	^ aBlock value: [ :answer |
		[ continuation value: answer ]
			on: WAMarkerRequest
			do: [ :request | request resume: self seasideCallbackMarker ] ]
]
