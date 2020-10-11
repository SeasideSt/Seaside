testing
testContextFunctionalTest
	| possibleResponses requestHandlers responseText |
	self selectTest: 'WAContextFunctionalTest'.

	self assert: ((GRCodec allCodecs collect: #printString) includes: ((driver findElementByID: 'Codec:') findElementByXPath: './td') getText).
	self assert: ((driver findElementByID: 'Session:') findElementByXPath: './td') getText equals: 'a WASession'.
	self assert: ((driver findElementByID: 'Application:') findElementByXPath: './td') getText equals: 'a WAApplication'.
	self assert: (((driver findElementByID: 'Request:') findElementByXPath: './td') getText beginsWith: 'a WARequest').
	
	possibleResponses := WAResponse allSubclasses collect:[ :c | 'a ', c name ].
	responseText := ((driver findElementByID: 'Response:') findElementByXPath: './td') getText.
	self assert: (possibleResponses anySatisfy: [ :prefix | responseText beginsWith: prefix]).
	
	requestHandlers := driver findElementByID: 'handlers'.
	self assert: (requestHandlers findElementByXPath: './ol/li[1]') getText equals: 'a WARenderPhaseContinuation'.
	self assert: (requestHandlers findElementByXPath: './ol/li[2]') getText equals: 'a WASession'.
	self assert: (requestHandlers findElementByXPath: './ol/li[3]') getText equals: 'a WAApplication'.
	self assert: (requestHandlers findElementByXPath: './ol/li[4]') getText equals: 'a WADispatcher'