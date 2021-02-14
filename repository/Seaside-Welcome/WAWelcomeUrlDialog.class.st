Class {
	#name : #WAWelcomeUrlDialog,
	#superclass : #WAPainter,
	#category : 'Seaside-Welcome'
}

{ #category : #urls }
WAWelcomeUrlDialog class >> clearServerUrl [
	WAAdmin defaultDispatcher
		serverProtocol: nil;
		serverHostname: nil;
		serverPort: nil;
		serverPath: nil
]

{ #category : #urls }
WAWelcomeUrlDialog class >> serverUrl [
	| dispatcher |
	dispatcher := WAAdmin defaultDispatcher.
	(dispatcher serverProtocol isNil and: [ dispatcher serverHostname isNil and: [
		dispatcher serverPort isNil and: [ dispatcher serverPath isNil ] ] ])
			ifTrue: [ ^ nil ].
	^ dispatcher url
]

{ #category : #urls }
WAWelcomeUrlDialog class >> serverUrl: aUrl [
	WAAdmin defaultDispatcher
		serverProtocol: aUrl scheme;
		serverHostname: aUrl host;
		serverPort: aUrl port;
		serverPath: aUrl pathStringUnencoded
]

{ #category : #rendering }
WAWelcomeUrlDialog >> renderContentOn: html [
	| url input |
	html form
		onSubmit: (html javascript return: false);
		with: [ 
			(input := html textInput)
				value: self serverUrl greaseString;
				callback: [ :urlString | url := WAUrl absolute: urlString ].
			self serverUrl isNil ifTrue: [ 
				"Setup a sample string"
				input
					value: 'http://localhost:8080/';
					class: 'sampleValue';
					script:
						(html jQuery this onFocus:
							((html jQuery this)
								value: '';
								removeClass: 'sampleValue';
								unbind: 'focus')) ].
			html button
				bePush;
				onClick:
					(((html jQuery: #confirm) load)
						html: '';
						serializeForm;
						html: [ :r | self renderTryingUrl: url on: r ]);
				with: 'Test' ].
	html div id: 'confirm'
]

{ #category : #rendering }
WAWelcomeUrlDialog >> renderSuccessUrl: url on: html [
	html paragraph: [ 
		html text: 'Success! '.
		html button
			bePush;
			onClick:
				((html jQuery ajax)
					callback: [ self serverUrl: url ];
					onComplete: html javascript refresh);
		with: 'Update Configuration' ]
]

{ #category : #rendering }
WAWelcomeUrlDialog >> renderTryingUrl: url on: html [
	| testUrl |
	testUrl := url copy addAllToPath: (WAAdmin defaultDispatcher url relativeTo: self requestContext handler url).
	html paragraph: 'Trying ' , testUrl greaseString , ' ...'.
	html script:
		((html jQuery ajax)
			script: [ :s | 
				s <<
					(s jQuery: '#confirm')
						append: [ :r |  self renderSuccessUrl: url on: r ] ];
						optionAt: 'url' put: testUrl;
						yourself)
]

{ #category : #private }
WAWelcomeUrlDialog >> serverUrl [
	^ self class serverUrl
]

{ #category : #private }
WAWelcomeUrlDialog >> serverUrl: aUrl [
	self class serverUrl: aUrl
]
