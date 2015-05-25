urls
serverUrl
	| dispatcher |
	dispatcher := WAAdmin defaultDispatcher.
	(dispatcher serverProtocol isNil and: [ dispatcher serverHostname isNil and: [
		dispatcher serverPort isNil and: [ dispatcher serverPath isNil ] ] ])
			ifTrue: [ ^ nil ].
	^ dispatcher url