as yet unclassified
handleRequest: aWARequest
	| handler context |
	handler := WAVariableQueryTestRestfulHandler new yourself.
	context := WARequestContext request: aWARequest response: WABufferedResponse new.
	[ WACurrentRequestContext use: context during: [ handler handleFiltered: context ] ]
		on: WAResponseNotification
		do: [ :ex |  ].
	^ context response