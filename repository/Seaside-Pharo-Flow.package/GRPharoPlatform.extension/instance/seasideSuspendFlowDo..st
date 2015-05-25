*seaside-pharo-flow
seasideSuspendFlowDo: aBlock
	| continuation |
	continuation := WAPartialContinuation
		from: thisContext sender
		to: self seasideCallbackMarker.
	^ aBlock value: [ :answer |
		[ continuation value: answer ]
			on: WAMarkerRequest
			do: [ :request | request resume: self seasideCallbackMarker ] ]