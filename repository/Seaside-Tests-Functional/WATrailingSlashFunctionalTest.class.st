Class {
	#name : #WATrailingSlashFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #private }
WATrailingSlashFunctionalTest >> baseUrlWithSlash: aBoolean [ 
	^ self application url
		addToPath: self class name greaseString;
		addField: 'slash'
			value: aBoolean greaseString;
		slash: aBoolean;
		yourself
]

{ #category : #rendering }
WATrailingSlashFunctionalTest >> renderContentOn: html [
	self renderExplanationOn: html.
	self renderLinksOn: html
]

{ #category : #rendering }
WATrailingSlashFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This tests whether the sever adapter correctly passes the tailing slash of the request URL to the request context.'.
	html paragraph: 'Click each of the links below, and the status should change from "not run" to "success".'
]

{ #category : #rendering }
WATrailingSlashFunctionalTest >> renderLinksOn: html [
	html table: [
		html tableRow: [
			html tableData: [
				self renderSlashSuccess: true on: html ].
			html tableData: [
				html anchor
				url: (self baseUrlWithSlash: true);
				with: 'With Slash' ] ].
		
		html tableRow: [
			html tableData: [
				self renderSlashSuccess: false on: html ].
			html tableData: [
				html anchor
				url: (self baseUrlWithSlash: false);
				with: 'Without Slash' ] ] ]
]

{ #category : #private }
WATrailingSlashFunctionalTest >> renderSlashSuccess: aBoolean on: html [ 
	| request hasTrailingSlash expectedSlash |
	request := self requestContext request.
	hasTrailingSlash := request url slash.
	expectedSlash := request fields 
		at: 'slash'
		ifAbsent: [ nil ].
	expectedSlash isNil 
		ifTrue: [ html strong: 'not run' ]
		ifFalse: [
			aBoolean greaseString = expectedSlash 
				ifTrue: [
					hasTrailingSlash greaseString = expectedSlash 
						ifTrue: [ html strong: 'success' ]
						ifFalse: [ html strong: 'fail' ] ]
				ifFalse: [ html strong: 'not run' ] ]
]
