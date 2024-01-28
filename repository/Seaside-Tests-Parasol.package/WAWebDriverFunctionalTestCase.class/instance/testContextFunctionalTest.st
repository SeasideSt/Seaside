testing
testContextFunctionalTest
	| possibleResponses requestHandlers responseText |
	self selectTest: 'WAContextFunctionalTest'.

	self assert: ((GRCodec allCodecs collect: #printString) includes: ((driver findElementByID: 'Codec:') findElementByXPath: './td') getText).
	self assert: (((driver findElementByID: 'Session:') findElementByXPath: './td') getText copyWithout: Character space) equals: 'aWASession'.
	self assert: (((driver findElementByID: 'Application:') findElementByXPath: './td') getText copyWithout: Character space) equals: 'aWAApplication'.
	self assert: ((((driver findElementByID: 'Request:') findElementByXPath: './td') getText copyWithout: Character space) greaseBeginsWith: 'aWARequest').
	
	possibleResponses := WAResponse allSubclasses collect:[ :c | 'a ', c name ].
	responseText := ((driver findElementByID: 'Response:') findElementByXPath: './td') getText.
	self assert: (possibleResponses anySatisfy: [ :prefix | responseText greaseBeginsWith: prefix ]).
	
	requestHandlers := driver findElementByID: 'handlers'.
	self assert: ((requestHandlers findElementByXPath: './ol/li[1]') getText copyWithout: Character space) equals: 'aWARenderPhaseContinuation'.
	self assert: ((requestHandlers findElementByXPath: './ol/li[2]') getText copyWithout: Character space) equals: 'aWASession'.
	self assert: ((requestHandlers findElementByXPath: './ol/li[3]') getText copyWithout: Character space) equals: 'aWAApplication'.
	self assert: ((requestHandlers findElementByXPath: './ol/li[4]') getText copyWithout: Character space) equals: 'aWADispatcher'