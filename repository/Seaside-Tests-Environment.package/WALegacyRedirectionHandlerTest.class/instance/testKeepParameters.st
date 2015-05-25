tests
testKeepParameters
	| responseUrl response |
	[ handler handleFiltered: self requestContext ]
		on: WAResponseNotification
		do: [ :notification | "ignore" ].
	response := self requestContext response.
	self assert: response status = 301.
	responseUrl := response headerAt: 'Location'.
	self assert: responseUrl greaseString = '/pier/environment/pier.png?view=PRDownloadView'