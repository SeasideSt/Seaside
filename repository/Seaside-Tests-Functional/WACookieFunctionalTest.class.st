Class {
	#name : #WACookieFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'firstKey',
		'firstValue',
		'firstPath',
		'secondKey',
		'secondValue',
		'secondPath'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #actions }
WACookieFunctionalTest >> addBoth [
	self requestContext response addCookie: self firstCookie.
	self requestContext response addCookie: self secondCookie.
	
	self resetFirst.
	self resetSecond
]

{ #category : #actions }
WACookieFunctionalTest >> addFirst [
	self requestContext response addCookie: self firstCookie.
	
	self resetFirst
]

{ #category : #accessing }
WACookieFunctionalTest >> cookies [
	^ self requestContext request cookies
]

{ #category : #accessing }
WACookieFunctionalTest >> firstCookie [
	^ self requestContext newCookie
		key: self firstKey;
		value: self firstValue;
		path: self firstPath;
		yourself
]

{ #category : #accessing }
WACookieFunctionalTest >> firstKey [
	^ firstKey
]

{ #category : #accessing }
WACookieFunctionalTest >> firstKey: aString [
	firstKey := aString
]

{ #category : #accessing }
WACookieFunctionalTest >> firstPath [
	^ firstPath
]

{ #category : #accessing }
WACookieFunctionalTest >> firstPath: aString [
	firstPath := aString
]

{ #category : #accessing }
WACookieFunctionalTest >> firstValue [
	^ firstValue
]

{ #category : #accessing }
WACookieFunctionalTest >> firstValue: aString [
	firstValue := aString
]

{ #category : #initialization }
WACookieFunctionalTest >> initialize [
	super initialize.
	self firstPath: self application url pathStringUnencoded.
	self secondPath: self application url pathStringUnencoded
]

{ #category : #actions }
WACookieFunctionalTest >> remove: aCookie [
	self requestContext response deleteCookie: aCookie
]

{ #category : #'rendering-explanation' }
WACookieFunctionalTest >> renderCombiningOn: html [
	html listItem: 'Setting both cookies should work in Kom and is broken in Swazoo.'
]

{ #category : #rendering }
WACookieFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.

	html form: [
		html table: [
			self renderHeadingsOn: html.
			self renderCookiesOn: html.
			self renderInputOn: html ] ]
]

{ #category : #rendering }
WACookieFunctionalTest >> renderCookiesOn: html [
	self cookies do: [ :each |
		html tableRow: [
			html tableData: each key.
			html tableData: each value.
			html tableData: each path.
			html tableData: each domain.
			html tableData: each ports.
			html tableData: [
				html submitButton
					callback: [ self remove: each ];
					text: 'remove' ] ] ]
]

{ #category : #rendering }
WACookieFunctionalTest >> renderExplanationOn: html [
	html unorderedList: [
		self renderFirefoxOn: html.
		self renderSafariOn: html.
		self renderOperaOn: html.
		self renderRemoveOn: html ]
]

{ #category : #'rendering-explanation' }
WACookieFunctionalTest >> renderFirefoxOn: html [
	html listItem: 'On Firefox the path is not supposed to work. But if you look under Settings -> Cookies the cookie should be saved with the correct path.'
]

{ #category : #rendering }
WACookieFunctionalTest >> renderHeadingsOn: html [
	html tableRow: [
		html tableHeading: 'Key'.
		html tableHeading: 'Value'.
		html tableHeading: 'Path'.
		html tableHeading: 'Domain'.
		html tableHeading: 'Ports'.
		html tableHeading ]
]

{ #category : #rendering }
WACookieFunctionalTest >> renderInputFirstOn: html [
	html tableRow: [
		self renderInputForCookie: #first on: html.
		html tableData: [
			html submitButton
				on: #addFirst of: self ] ]
]

{ #category : #rendering }
WACookieFunctionalTest >> renderInputForCookie: aSymbol on: html [
	html tableData: [
		html textInput
			on: (aSymbol, #Key) asSymbol of: self ].
	html tableData: [
		html textInput
			on: (aSymbol, #Value) asSymbol of: self ].
	html tableData: [
		html textInput
			on: (aSymbol, #Path) asSymbol of: self ].
	html tableData.
	html tableData
]

{ #category : #rendering }
WACookieFunctionalTest >> renderInputOn: html [
	self renderInputFirstOn: html.
	self renderInputSecondOn: html
]

{ #category : #rendering }
WACookieFunctionalTest >> renderInputSecondOn: html [
	html tableRow: [
		self renderInputForCookie: #second on: html.
		html tableData: [
			html submitButton
				on: #addBoth of: self ] ]
]

{ #category : #'rendering-explanation' }
WACookieFunctionalTest >> renderOperaOn: html [
	html listItem: 'Opera is supposed to work perfectly.'
]

{ #category : #'rendering-explanation' }
WACookieFunctionalTest >> renderRemoveOn: html [
	html listItem: 'Removing should work on Firefox and Safari but only if the path is unchanged. On Opera it should delete the value and the path.'
]

{ #category : #'rendering-explanation' }
WACookieFunctionalTest >> renderSafariOn: html [
	html listItem: 'On Safari the path is not supposed to work. But if you look under Preferences -> Security -> Show Cookies the cookie should be saved with the correct path.'
]

{ #category : #private }
WACookieFunctionalTest >> resetFirst [
	self firstKey: nil.
	self firstValue: nil.
	self firstPath: self application url pathStringUnencoded
]

{ #category : #private }
WACookieFunctionalTest >> resetSecond [
	self secondKey: nil.
	self secondValue: nil.
	self secondPath: self application url pathStringUnencoded
]

{ #category : #accessing }
WACookieFunctionalTest >> secondCookie [
	^ self requestContext newCookie
		key: self secondKey;
		value: self secondValue;
		path: self secondPath;
		yourself
]

{ #category : #accessing }
WACookieFunctionalTest >> secondKey [
	^ secondKey
]

{ #category : #accessing }
WACookieFunctionalTest >> secondKey: aString [
	secondKey := aString
]

{ #category : #accessing }
WACookieFunctionalTest >> secondPath [
	^ secondPath
]

{ #category : #accessing }
WACookieFunctionalTest >> secondPath: aString [
	secondPath := aString
]

{ #category : #accessing }
WACookieFunctionalTest >> secondValue [
	^ secondValue
]

{ #category : #accessing }
WACookieFunctionalTest >> secondValue: aString [
	secondValue := aString
]
