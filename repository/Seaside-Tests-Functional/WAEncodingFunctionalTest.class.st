"
A WAEncodingFunctionalTest test whether Seaside correctly handles non-ASCII strings. Unfortunately due to differences in server setup and source code encodings this test requires manual interaction.

"
Class {
	#name : #WAEncodingFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'urlencoded',
		'multipart',
		'get'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WAEncodingFunctionalTest >> get [
	^ get
]

{ #category : #accessing }
WAEncodingFunctionalTest >> get: aString [
	get := aString
]

{ #category : #initialization }
WAEncodingFunctionalTest >> initialize [
	super initialize.
	self urlencoded: 'urlencoded'.
	self multipart: 'multipart'.
	self get: 'get'
]

{ #category : #accessing }
WAEncodingFunctionalTest >> multipart [
	^ multipart
]

{ #category : #accessing }
WAEncodingFunctionalTest >> multipart: aString [
	multipart := aString
]

{ #category : #rendering }
WAEncodingFunctionalTest >> renderCharacterByCharacter: aString on: html [
	"Display aString character by character, but wrap each character into a span so it ends up individually in the output stream. If the codec does not convert to the internal encoding of Smalltalk the result is broken. Either choose an appropriate codec or be aware of the concequences."
	
	self requestContext codec name = '(none)'
	"Character by character rendering will fail for the NullCoded in case of multi byte characters. Don't test it."
		ifTrue: [ ^ self ].
	aString 	do: [ :each | html span: each ]
]

{ #category : #rendering }
WAEncodingFunctionalTest >> renderClassName: aString on: html [ 
	aString isNil ifTrue: [ ^ self ].
	html paragraph: [
		html strong: 'Class: '.
		html text: aString class name ]
]

{ #category : #rendering }
WAEncodingFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	self renderUrlencodedOn: html.
	self renderMultipartOn: html.
	self renderGetOn: html
]

{ #category : #rendering }
WAEncodingFunctionalTest >> renderExplanationOn: html [
	html unorderedList: [
		html listItem: [
			html text: 'Go to the '.
			html anchor
				url: 'http://www.columbia.edu/kermit/utf8.html';
				with: 'UTF-8 Sampler'.
			html text: ' and select some "foreign" text.' ].
		html listItem: 'Copy and paste it into the urlencoded text field below and click the submit button.'.
		html listItem: 'The heading, textfield, character field and submitt button should all display the text without any error.'.
		html listItem: 'Submit again without changing anything, again everything should display normally.'.
		html listItem: 'Repeat this process for the multipart field. Make sure to pick at least every of these languages: German, Czech, Korean.' ]
]

{ #category : #rendering }
WAEncodingFunctionalTest >> renderGetOn: html [

	html heading level2;
		with: 'GET'.
	html heading level3;
		with: self get.
	self renderCharacterByCharacter: self get on: html.
	html form
		get;
		with: [
			html div: [
				html textInput
					on: #get of: self.
				html submitButton
					text: self get ] ].
	self renderClassName: self get on: html
]

{ #category : #rendering }
WAEncodingFunctionalTest >> renderMultipartOn: html [

	html heading level2;
		with: 'Multipart'.
	html heading level3;
		with: self multipart.
	self renderCharacterByCharacter: self multipart on: html.
	html form
		multipart;
		with: [
			html div: [
				html textInput
					on: #multipart of: self.
				html submitButton
					text: self multipart ] ].
	self renderClassName: self multipart on: html
]

{ #category : #rendering }
WAEncodingFunctionalTest >> renderUrlencodedOn: html [

	html heading level2;
		with: 'Urlencoded'.
	html heading level3;
		with: self urlencoded.
	self renderCharacterByCharacter: self urlencoded on: html.
	html form: [
		html div: [
			html textInput
				on: #urlencoded of: self.
			html submitButton
				text: self urlencoded ] ].
	self renderClassName: self urlencoded on: html
]

{ #category : #accessing }
WAEncodingFunctionalTest >> urlencoded [
	^ urlencoded
]

{ #category : #accessing }
WAEncodingFunctionalTest >> urlencoded: aString [
	urlencoded := aString
]
