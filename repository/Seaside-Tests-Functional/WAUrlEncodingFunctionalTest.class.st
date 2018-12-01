Class {
	#name : #WAUrlEncodingFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'input'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #initialization }
WAUrlEncodingFunctionalTest >> initialize [
	super initialize.
	input := 'input'
]

{ #category : #accessing }
WAUrlEncodingFunctionalTest >> input [
	^ input
]

{ #category : #accessing }
WAUrlEncodingFunctionalTest >> input: aString [
	input := aString
]

{ #category : #accessing }
WAUrlEncodingFunctionalTest >> parameter [
	| fieldValue request urlValue |
	request := self requestContext request.
	fieldValue := request at: 'input' ifAbsent: [ nil ].
	urlValue := request url queryFields at: 'input' ifAbsent: [ nil ].
	^ (urlValue = input and: [ fieldValue = input ])
		ifTrue: [ fieldValue ]
		ifFalse: [ 'fail!' ]
]

{ #category : #accessing }
WAUrlEncodingFunctionalTest >> path [
	| path |
	path := self requestContext request url path last.
	^ path = input
		ifTrue: [ path ]
		ifFalse: [ 'fail!' ]
]

{ #category : #rendering }
WAUrlEncodingFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.

	html form
		get;
		with: [
			html div: [
				html textInput
					on: #input of: self.
				html submitButton ] ].
		
	html definitionList: [
		html definitionTerm: 'Input'.
		html definitionData: self input.
		
		html definitionTerm: 'Parameter'.
		html definitionData: self parameter.
		
		html definitionTerm: 'Path'.
		html definitionData: self path ]
]

{ #category : #rendering }
WAUrlEncodingFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This tests whether url encoding works.'.
	html unorderedList: [
		html listItem: [
			html text: 'Go to the '.
			html anchor
				url: 'http://www.columbia.edu/kermit/utf8.html';
				with: 'UTF-8 Sampler'.
			html text: ' and select some "foreign" text.' ].
		html listItem: 'Copy and paste it into the urlencoded text field below and click the submit button.'.
		html listItem: 'The text should be displayed below "Input", "Parameter" and "Path" without any error.'.
		html listItem: 'The text may appear in the address bar of the browser.'.
		html listItem: 'Repeat this process. Make sure to pick at least every of these languages: German, Czech, Korean.' ]
]

{ #category : #updating }
WAUrlEncodingFunctionalTest >> updateUrl: aUrl [
	super updateUrl: aUrl.
	input isEmptyOrNil ifTrue: [ ^ self ].
	aUrl addToPath: input.
	aUrl addField: 'input' value: input
]
