tests
testUrlFor
	| context request response documentHandler url |
	request := self requestWithMethod: 'GET'.
	request setCookies: (Array with: (WARequestCookie key: '_s' value: 'sessionid')).
	response := WABufferedResponse new.
	documentHandler := (WADocumentHandler
		document: 'body: {color: red}'
		mimeType: WAMimeType textCss
		fileName: nil).
	
	context := WARequestContext request: request response: response.
	url := WACurrentRequestContext
		use: context
		during: [ handler register: documentHandler;
			urlFor: documentHandler ].
	self assert: (url queryFields includesKey: '_s').
	request url addField: '_s' value: (url queryFields at: '_s').
		
	[  handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
		
	self assert: response status = 200.
	self assert: (response cookies isEmpty)