Class {
	#name : #WAContextFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAContextFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	html table: [
		self renderLabel: 'Codec:' value:  self requestContext codec on: html.
		self renderLabel: 'Session:' value:  self requestContext session on: html.
		self renderLabel: 'Application:' value:  self requestContext application on: html.
		self renderLabel: 'Request:' value:  self requestContext request on: html.
		self renderLabel: 'Response:' value:  self requestContext response on: html.
		self renderRequestHandlersOn: html.
		self renderPropertiesOn: html ]
]

{ #category : #rendering }
WAContextFunctionalTest >> renderExplanationOn: html [

	html paragraph: 'The purpose of this test is to make sure WAContext and WACurrentContext work correctly. For each label you should see the print string of one or several matching objects. For the ''Request Handlers'' the first object should be a WASession or subclass, the second a WAApplication and then one or several WADispatchers matching the path.'
]

{ #category : #rendering }
WAContextFunctionalTest >> renderLabel: aString value: anObject on: html [
	html tableRow: [
		html tableHeading: aString.
		html tableData: anObject ]
]

{ #category : #rendering }
WAContextFunctionalTest >> renderPropertiesOn: html [
	html tableRow: [
		html tableHeading: 'Properties:'.
		html tableData: [
			| properties |
			properties := self requestContext properties.
			properties isEmpty ifFalse: [
				html definitionList: [
					properties keysAndValuesDo: [ :key :value |
						html definitionTerm: key.
						html definitionData: value ] ] ] ] ]
]

{ #category : #rendering }
WAContextFunctionalTest >> renderRequestHandlersOn: html [ 
	html tableRow: [
		html tableHeading: 'Request Handlers:'.
		html tableData: [ 
			html orderedList list: self requestContext handlers ] ]
]
