handling
executeResult: aRouteResult
	| requestContext |
	requestContext := self requestContext.
	requestContext respond: [ :response |
		| mimeType |
		mimeType := aRouteResult seasideMimeType.
		mimeType isNil
			ifTrue: [
				response
					document: (aRouteResult sendMessageTo: self) ]
			ifFalse: [
				mimeType isBinary ifFalse: [
					"defensive copy because we modify"
					mimeType := mimeType copy.
					mimeType charset: requestContext charSet ].
				response
					document: (aRouteResult sendMessageTo: self)
					mimeType: mimeType ] ]