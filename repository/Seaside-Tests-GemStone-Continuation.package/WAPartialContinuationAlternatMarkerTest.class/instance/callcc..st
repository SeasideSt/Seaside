private
callcc: aBlock
	^WAPartialContinuation 
		currentDo: aBlock 
		markerBlock: [ self callbackMarker ]