rendering
renderRequestBodyOn: html
	html hiddenInput
		callback: [ self readRequestBody ].
	html strong: 'Request Body:'.
	ran
		ifTrue: [ html text: (hasBody ifTrue: [ 'Success' ] ifFalse: [ 'Fail' ]) ]
		ifFalse: [ html text: 'Not Run' ].
	html break