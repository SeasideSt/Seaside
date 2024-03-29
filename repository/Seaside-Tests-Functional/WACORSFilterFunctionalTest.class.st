Class {
	#name : 'WACORSFilterFunctionalTest',
	#superclass : 'WAFunctionalTest',
	#category : 'Seaside-Tests-Functional',
	#package : 'Seaside-Tests-Functional'
}

{ #category : 'initialization' }
WACORSFilterFunctionalTest class >> register [
	<script>

	WAAdmin register: self asApplicationAt: 'corsTest'
]

{ #category : 'accessing-urls' }
WACORSFilterFunctionalTest >> baseUrl [

	| parts url |
	parts := self requestContext request host findTokens: ':'.
	url := self requestContext request url withoutSeasideQueryFields path: OrderedCollection new.
	url host: parts first.
	parts size > 1 ifTrue: [ url port: parts last asInteger ].

	^ url
]

{ #category : 'accessing-urls' }
WACORSFilterFunctionalTest >> buildDataUrlFor: host port: port [

	^self baseUrl
		 port: port;
		 addToPath: 'tests';
		 addToPath: 'corsData';
		 addToPath: 'entries';
		 yourself
]

{ #category : 'private' }
WACORSFilterFunctionalTest >> corsFilter [

	^ [ 
	  (WADispatcher default handlerAtAll: #( 'tests' 'corsData' ))
		  filters detect: [ :each | each isKindOf: WACORSFilter ] ]
		  on: Error
		  do: [ :ex | ex return: nil ]
]

{ #category : 'accessing-urls' }
WACORSFilterFunctionalTest >> crossOriginDataUrl [

	| parts host port |
	parts := self requestContext request host substrings: ':'.
	host := parts first.
	port := parts last greaseInteger.
	self assert: port ~= WACORSResourceExample corsAdaptorPort.
	^ self buildDataUrlFor: host port: WACORSResourceExample corsAdaptorPort
]

{ #category : 'javascript' }
WACORSFilterFunctionalTest >> errorHandlerFunction [

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "Red"'), 
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>Error</p>"'),
		(JSStream on: 'document.getElementById("result-contents").innerHTML = ""; response.text().then((text) => document.getElementById("result-contents").innerHTML += "<p>"+text+"</p>")')
		  asFunction: #( 'response' )
]

{ #category : 'private' }
WACORSFilterFunctionalTest >> originTextToUrlTable [

	^ GRSmallDictionary2 new
		  add: 'Same Origin' -> self sameOriginDataUrl;
		  add: 'Cross Origin' -> self crossOriginDataUrl;
		  yourself
]

{ #category : 'rendering' }
WACORSFilterFunctionalTest >> renderAdaptorSetupOn: html [

	html paragraph:
		'This test needs to setup a separate Seaside server adaptor, to handle requests at a different host:port, in order to make requests cross-origin.'.

	html form: [ 
		html button
			callback: [ 
				WACORSResourceExample
					register;
					registerCorsAdaptor ];
			with: 'Register CORS Server adaptor' ]
]

{ #category : 'rendering-configuration' }
WACORSFilterFunctionalTest >> renderCORSFilterMethodsOn: html [

	html heading
		level2;
		with: 'Currently allowed Methods.'.
	self corsFilter allowedMethods
		ifEmpty: [ html text: 'None' ]
		ifNotEmpty: [ :allowed | html unorderedList list: allowed ].

	html form: [ 
		html button
			callback: [ 
				self corsFilter
					addAllowedMethod: 'DELETE' ];
			with: 'Allow DELETE'.
		html space.

		html button
			callback: [ self corsFilter removeAllMethods ];
			with: 'Remove all methods' ]
]

{ #category : 'rendering-configuration' }
WACORSFilterFunctionalTest >> renderCORSFilterOriginsOn: html [

	html heading
		level2;
		with: 'Currently allowed Origins:'.
	html paragraph
		id: 'allowed-origins';
		with:[
			self corsFilter allowedOrigins
				ifEmpty: [ html text: 'None' ]
				ifNotEmpty: [ :origins | html unorderedList list: origins ] ].

	html form: [ 
		html button
			callback: [ self corsFilter allowAnyOrigin ];
			with: 'Allow any origin'.

		html space.

		html button
			callback: [ 
				self corsFilter
					addAllowedOrigin: (self baseUrl greaseString allButLast) ];
			with: 'Allow other origin'.
		html space.

		html button
			callback: [ self corsFilter denyAllOrigins ];
			with: 'Deny all origins' ]
]

{ #category : 'rendering' }
WACORSFilterFunctionalTest >> renderContentOn: html [

  	html heading: 'CORS Test Page'.
	html paragraph: self requestContext request host.
	self runningOnGemStone ifTrue: [ 
      html paragraph: 'Make sure the CORS adaptor is running manually since we cannot check it when running on GemStone.' ].
  (self runningOnGemStone not
    and: [ WACORSResourceExample corsAdaptor isNil
        or: [ WACORSResourceExample corsAdaptor isRunning not ] ])
    ifTrue: [ self renderAdaptorSetupOn: html ]
    ifFalse: [ 
      self corsFilter
        ifNil: [ self renderResourceRegistrationOn: html ]
        ifNotNil: [ self renderTestingOn: html ] ]
]

{ #category : 'rendering-tests' }
WACORSFilterFunctionalTest >> renderMethodPreflightTestOn: html [

	html heading
		level2;
		with: 'Make some DELETE requests'.
	html paragraph: 'These test will trigger an OPTIONS preflight request when crossing origins.'.
	html div
		id: 'delete-requests';
		with: [
			self originTextToUrlTable keysAndValuesDo: [ :text :url | 
				html button
					onClick: ((JSStream on:('document.getElementById("result-contents").innerHTML = "Doing request..."; fetch(<1p>, {method: "DELETE"})' expandMacrosWith: url greaseString))
					 		call: 'then'
					 		with: self successHandlerFunction
					 		with: self errorHandlerFunction);
					with: text.
				html space ] ]
]

{ #category : 'rendering' }
WACORSFilterFunctionalTest >> renderRequestResultIndicatorOn: html [
	html heading
		level2;
		with: 'Result'.
	html div
		id: 'result'.
	html div
		id: 'result-contents'
]

{ #category : 'rendering' }
WACORSFilterFunctionalTest >> renderResourceRegistrationOn: html [

	html paragraph:
		('This test needs REST request handler located at <1p>.' 
			 expandMacrosWith: WACORSResourceExample resourceUrl).
	html form: [ 
		html button
			callback: [ WACORSResourceExample register ];
			with: 'Register CORS Resource' ]
]

{ #category : 'rendering-tests' }
WACORSFilterFunctionalTest >> renderSimpleRequestTestOn: html [

	html heading
		level2;
		with: 'Make GET requests'.
	html div
		id: 'get-requests';
		with:[
			self originTextToUrlTable keysAndValuesDo: [ :text :url | 
				html button
					onClick:
						((JSStream on: ('document.getElementById("result-contents").innerHTML = "Doing request..."; fetch(<1p>)' expandMacrosWith: url greaseString))
					 		call: 'then'
					 		with: self successHandlerFunction
					 		with: self errorHandlerFunction);
				with: text.
			html space ] ]
]

{ #category : 'rendering' }
WACORSFilterFunctionalTest >> renderTestingOn: html [

	html paragraph:[
		html text: ('This test will make asynchronous requests to a request handler at <1p>.' 
			 expandMacrosWith: self corsFilter handler url).
		html text: 'We recommend opening the developer console and see the requests in the "Network tab".'.
		html html: 'For more information about CORS <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS" target="_blank">read this documentation at MDN</a>.' ].
	html horizontalRule.
	self renderCORSFilterOriginsOn: html.
	self renderCORSFilterMethodsOn: html.
	html horizontalRule.
	self renderTestsOn: html.
	html horizontalRule.
	self renderRequestResultIndicatorOn: html.
]

{ #category : 'rendering' }
WACORSFilterFunctionalTest >> renderTestsOn: html [

	self renderSimpleRequestTestOn: html.
	self renderMethodPreflightTestOn: html
]

{ #category : 'private' }
WACORSFilterFunctionalTest >> runningOnGemStone [
  ^ (Smalltalk at: #'GemServer' ifAbsent: [ nil ]) notNil
]

{ #category : 'accessing-urls' }
WACORSFilterFunctionalTest >> sameOriginDataUrl [

	| parts host port |
	parts := self requestContext request host substrings: ':'.
	host := parts first.
	port := parts last greaseInteger.
	^ self buildDataUrlFor: host port: port
]

{ #category : 'accessing-urls' }
WACORSFilterFunctionalTest >> style [ 

	^ '#result { 
		width: 200px;
		height: 40px;
		color: white;
		padding: 10px;
	 }
	'
]

{ #category : 'javascript' }
WACORSFilterFunctionalTest >> successHandlerFunction [

	^ (JSStream on: 'document.getElementById("result").style.backgroundColor = "DarkGreen"'),
		(JSStream on: 'document.getElementById("result").innerHTML = "<p>Success</p>"'),
		(JSStream on: 'document.getElementById("result-contents").innerHTML = ""; response.text().then((text) => document.getElementById("result-contents").innerHTML += "<p>"+text+"</p>")')
		  asFunction: #( 'response' )
]
