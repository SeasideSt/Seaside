tests
testRendering
	| context request responseContents |
	request := self requestWithMethod: 'GET'.
	context := WARequestContext request: request response: WABufferedResponse new.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
	self assert: context response status = 200.
	responseContents := context response contents.
	self assert: (responseContents beginsWith: '<h1>').
	self assert: (responseContents endsWith: '</a>')