*Seaside-WebSocket-Zinc
contextFor: aZnRequest
	| context |
	context := super contextFor: aZnRequest.
	(context request isWebSocketSetupRequest)
		ifTrue:[ context webSocketCreator: (WAZincWebSocketCreator new) ].
	^ context