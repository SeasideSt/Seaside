Class {
	#name : #JQAllFunctionalTests,
	#superclass : #WAComponent,
	#instVars : [
		'default',
		'tests',
		'contents'
	],
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #testing }
JQAllFunctionalTests class >> canBeRoot [
	^ true
]

{ #category : #accessing }
JQAllFunctionalTests class >> description [
	^ 'jQuery Functional Test Suite'
]

{ #category : #initialization }
JQAllFunctionalTests class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'javascript/jquery'.
	application preferenceAt: #scriptGeneratorClass put: JQScriptGenerator.
	application 
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQAllFunctionalTestsLibrary.

	application := WAAdmin register: WAAllFunctionalTests asApplicationAt: 'tests/functional-ajaxified'.
	application preferenceAt: #scriptGeneratorClass put: JQScriptGenerator.
	application
		preferenceAt: #sessionClass put: WAExpirySession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQAjaxifierLibrary
]

{ #category : #hooks }
JQAllFunctionalTests >> children [
	^ Array with: contents
]

{ #category : #configuration }
JQAllFunctionalTests >> default [
	^ JQWelcomeFunctionalTest new
]

{ #category : #configuration }
JQAllFunctionalTests >> heading [
	^ self class description
]

{ #category : #hooks }
JQAllFunctionalTests >> initialRequest: aRequest [
	super initialRequest: aRequest.
	tests do: [ :category |
		category value do: [ :entry | | requestPath |
			requestPath := aRequest url path.
			requestPath isEmpty
				ifFalse: [
					(self pathFor: entry value title) = requestPath last
						ifTrue: [ contents := entry value ] ] ] ]
]

{ #category : #initialization }
JQAllFunctionalTests >> initialize [
	super initialize.
	tests := self tests.
	contents := default := self default
]

{ #category : #configuration }
JQAllFunctionalTests >> menu [
	^ #(('http://www.seaside.st/' 'Seaside') ('http://jquery.com/' 'jQuery') ('http://api.jquery.com/' 'Documentation'))
]

{ #category : #private }
JQAllFunctionalTests >> pathFor: aString [
	^ (aString select: [ :each | each isAlphaNumeric ]) asLowercase
]

{ #category : #rendering }
JQAllFunctionalTests >> renderBodyOn: html [
	html div class: 'body'; with: [ 
		self renderTestsOn: html.
		self renderMainOn: html.
		html div style: 'clear: both' ]
]

{ #category : #rendering }
JQAllFunctionalTests >> renderBottomOn: html [
	html div class: 'bottom'
]

{ #category : #'rendering-browser' }
JQAllFunctionalTests >> renderBrowserOn: html [
	self renderReadmeOn: html.
	self renderDemoOn: html.
	self renderSmalltalkOn: html.
	self renderJavascriptOn: html
]

{ #category : #rendering }
JQAllFunctionalTests >> renderContentOn: html [
	html div id: 'canvas'; with: [
		html div id: 'header'; with: [ 
			self renderHeaderOn: html ].
		html div id: 'content'; with: [
			self renderTopOn: html.
			self renderHeadOn: html.
			self renderBodyOn: html.
			self renderBottomOn: html ] ].
	self renderTimeoutOn: html
]

{ #category : #'rendering-browser' }
JQAllFunctionalTests >> renderDemoOn: html [
	html heading level: 4; with: 'Demo'.
	html div class: 'demo'; with: contents
]

{ #category : #rendering }
JQAllFunctionalTests >> renderHeadOn: html [
	html div class: 'head'; with: [
		html heading level: 2; with: [
			html anchor
				callback: [ contents := default ];
				with: self heading ].
		html paragraph: self slogan ]
]

{ #category : #rendering }
JQAllFunctionalTests >> renderHeaderOn: html [
	self renderLogoOn: html.
	self renderMenuOn: html
]

{ #category : #'rendering-browser' }
JQAllFunctionalTests >> renderJavascriptOn: html [
	| context |
	html heading level: 4; with: 'Source'.
	html div class: 'code'; with: [
		context := html context copy.
		context document: (WAPrettyPrintedDocument context: html context).
		context document scriptGenerator: html document scriptGenerator class new.
		contents renderWithContext: context.
		context document scriptGenerator closeOn: context document ]
]

{ #category : #rendering }
JQAllFunctionalTests >> renderLogoOn: html [
	html heading level: 1; class: 'logo'; with: [
		html anchor
			title: self title;
			callback: [ contents := default ];
			with: [ html span: self title ] ]
]

{ #category : #rendering }
JQAllFunctionalTests >> renderMainOn: html [
	html div class: 'main'; with: [
		html heading
			level: 3;
			with: contents title.
		contents selectors isEmpty
			ifTrue: [ html render: contents ]
			ifFalse: [ self renderBrowserOn: html ] ]
]

{ #category : #rendering }
JQAllFunctionalTests >> renderMenuOn: html [
	html div id: 'menu'; with: [
		html div class: 'left'.
		html unorderedList: [
			self menu do: [ :pair |
				html listItem: [
					html anchor
						url: pair first;
						with: pair last ] ] ].
		html div class: 'right' ]
]

{ #category : #'rendering-browser' }
JQAllFunctionalTests >> renderReadmeOn: html [
	contents renderReadmeOn: html
]

{ #category : #'rendering-browser' }
JQAllFunctionalTests >> renderSmalltalkOn: html [ 
	| source |
	html heading level: 4; with: 'Smalltalk'.
	contents selectors do: [ :selector | 
		source := ((contents class whichClassIncludesSelector: selector) 
			sourceCodeAt: selector) greaseString readStream.
		html div class: 'code'; with: [
			html span
				class: 'signature';
				with: [ html text: contents class name; text: '>>'; text: source nextLine ].
			html break.
			[ source atEnd ] whileFalse: [ 
				[ source peek = Character tab ] whileTrue: [ 
					html space; space; space.
					source next ].
				html render: source nextLine; break ] ] ]
		separatedBy: [ html break ]

]

{ #category : #rendering }
JQAllFunctionalTests >> renderTestsOn: html [
	html div class: 'tests'; with: [
		tests do: [ :titleAndItems |
			html heading level: 3; with: titleAndItems key.
			html unorderedList: [
				titleAndItems value do: [ :titleAndClass |
					html listItem
						class: 'active' if: contents = titleAndClass value;
						with: [ 
							html anchor
								useBaseUrl;
								callback: [ contents := titleAndClass value ];
								extraPath: (self pathFor: titleAndClass value title);
								with: titleAndClass key ] ] ] ] ]
]

{ #category : #rendering }
JQAllFunctionalTests >> renderTimeoutOn: html [
	"Warn the user if an error occurs during an AJAX action (mostly this is a session timeout) and refreshes the current page (causing the default error/expiry handling to kick in)."

	html document addLoadScript: (html jQuery ajaxSetup
		onError: (html javascript
			alert: 'The session has expired.';
			refresh))
			
	"An alternative implementation is to trigger a request now and then so that the session never expires:"
	"html document addLoadScript: (html jQuery ajax
		callback: [ 'the session is active' ]; 
		interval: 60 seconds)"
]

{ #category : #rendering }
JQAllFunctionalTests >> renderTopOn: html [
	html div class: 'top'
]

{ #category : #configuration }
JQAllFunctionalTests >> slogan [
	^ 'Say it in Smalltalk, Do it with jQuery'
]

{ #category : #hooks }
JQAllFunctionalTests >> states [
	^ Array with: self
]

{ #category : #configuration }
JQAllFunctionalTests >> tests [
	^ Array 
		with: 'Ajax' -> (Array 
			with: 'Ajax' -> JQAjaxFunctionalTest new
			with: 'Form' -> JQFormFunctionalTest new
			with: 'Request' -> JQRequestFunctionalTest new
			with: 'JSON' -> JQJsonFunctionalTest new
			with: 'Counter' -> JQCounterFunctionalTest new
			with: 'Repeating' -> JQRepeatingFunctionalTest new)
		with: 'Other' -> (Array
			with: 'Effect' -> JQEffectsFunctionalTest new
			with: 'Animate' -> JQAnimateFunctionalTest new)
]

{ #category : #configuration }
JQAllFunctionalTests >> title [
	^ 'jQuery for Seaside'
]

{ #category : #updating }
JQAllFunctionalTests >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self title
]

{ #category : #updating }
JQAllFunctionalTests >> updateUrl: aUrl [
	super updateUrl: aUrl.
	aUrl addToPath: (self pathFor: contents title)
]

{ #category : #configuration }
JQAllFunctionalTests >> url [
	^ 'http://www.jquery.com/'
]
