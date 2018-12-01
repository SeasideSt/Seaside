"
A WAParameterFunctionalTest tests whether GET and POST fields are merged in WARequest >> #fields.
"
Class {
	#name : #WAParameterFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'wasExecuted',
		'values'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WAParameterFunctionalTest >> actionUrlFor: html [
	| url |
	url := html actionUrl copy.
	url
		addField: self parameterName
		value: self firstParameterValue.
	^ url
]

{ #category : #accessing }
WAParameterFunctionalTest >> firstParameterValue [
	^ 'firstValue'
]

{ #category : #initialization }
WAParameterFunctionalTest >> initialize [
	super initialize.
	wasExecuted := false
]

{ #category : #accessing }
WAParameterFunctionalTest >> parameterName [
	^ 'parameter'
]

{ #category : #rendering }
WAParameterFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	wasExecuted
		ifTrue: [ self renderExecutedOn: html ]
		ifFalse: [ self renderNotExecutedOn: html ]
]

{ #category : #rendering }
WAParameterFunctionalTest >> renderExecutedOn: html [
	html strong: (self wasSuccessful ifTrue: [ 'success' ] ifFalse: [ 'fail' ])
]

{ #category : #rendering }
WAParameterFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This test makes sure the server passes both GET and POST paramters to Seaside. Simply hit ''run test'' and ''success'' should be displayed. If ''fail'' is displayed or ''run test'' is displayed again then the test has failed.'
]

{ #category : #rendering }
WAParameterFunctionalTest >> renderNotExecutedOn: html [
	html form
		action: (self actionUrlFor: html);
		with: [
		 	html div: [
				html hiddenInput
					name: self parameterName;
					value: self secondParameterValue.
				html submitButton
					callback: [ self runTest ];
					text: 'run test' ] ]
]

{ #category : #actions }
WAParameterFunctionalTest >> runTest [
	values := self requestContext request fields allAt: self parameterName.
	wasExecuted := true
]

{ #category : #accessing }
WAParameterFunctionalTest >> secondParameterValue [
	^ 'secondValue'
]

{ #category : #testing }
WAParameterFunctionalTest >> wasSuccessful [
	^ values notNil
		and: [ values isCollection
		and: [ values isString not
		and: [ values size = 2
		and: [ (values includes: self firstParameterValue)
		and: [ (values includes: self secondParameterValue) ] ] ] ] ]
]
