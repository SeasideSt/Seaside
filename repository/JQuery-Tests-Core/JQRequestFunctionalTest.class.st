Class {
	#name : #JQRequestFunctionalTest,
	#superclass : #JQFunctionalTest,
	#instVars : [
		'logger'
	],
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #initialization }
JQRequestFunctionalTest >> initialize [
	super initialize.
	logger := OrderedCollection new
]

{ #category : #private }
JQRequestFunctionalTest >> loggerOn: aScript [
	aScript << ((aScript jQuery: #logger) contents remove).
	aScript << (logger
		inject: (aScript jQuery: #logger)
		into: [ :result :each | result append: [ :html | html text: each; break ] ]).
	logger := OrderedCollection new
]

{ #category : #rendering }
JQRequestFunctionalTest >> renderButton: aString ajax: anAjax on: html [
	html button
		bePush;
		onClick: (anAjax
			serializeForm;
			onSuccess: ((html jQuery: #logger)
				append: 'Request Success');
			script: [ :s | self loggerOn: s ]);
		with: aString
]

{ #category : #rendering }
JQRequestFunctionalTest >> renderContentOn: html [
	html form: [ 
		self renderText: 'Field 1' on: html.
		self renderText: 'Field 2' on: html.
		html div 
			id: 'logger';
			class: 'code'.
		html paragraph: [
			self renderButton: 'Get' ajax: html jQuery get on: html.
			self renderButton: 'Script' ajax: html jQuery getScript on: html.
			self renderButton: 'Post' ajax: html jQuery post on: html ] ]
]

{ #category : #rendering }
JQRequestFunctionalTest >> renderText: aString on: html [
	| id |
	html fieldSet: [
		html label
			for: (id := html nextId);
			with: aString.
		html span: [
			html textInput
				id: id;
				value: aString;
				callback: [ :value | logger addLast: aString , ': ' , value greaseString ] ] ]
]

{ #category : #accessing }
JQRequestFunctionalTest >> selectors [
	^ #(renderContentOn: renderButton:ajax:on:)
]

{ #category : #hooks }
JQRequestFunctionalTest >> style [
	^ 'fieldset { border: none; margin: 1em 0; padding: 0; }
fieldset label, fieldset span, fieldset p { display: block; float: left; width: 50%; margin: 0; padding: 0; }'
]

{ #category : #accessing }
JQRequestFunctionalTest >> title [
	^ 'Ajax Requests'
]
