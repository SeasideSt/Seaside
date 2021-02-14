Class {
	#name : #WAExceptionFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'renderError'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #accessing }
WAExceptionFunctionalTest >> exceptionFilter [
	^ self application filters detect: [ :each | each isExceptionFilter ] ifNone: [ nil ]
]

{ #category : #initialization }
WAExceptionFunctionalTest >> initialize [
	super initialize.
	renderError := false
]

{ #category : #actions }
WAExceptionFunctionalTest >> raiseDeprecated [
	self 
		greaseDeprecatedApi: 'WAExceptionFunctionalTest>>#raiseDeprecated'
		details: 'Test action phase deprecation.'.
	self 
		inform: [ :html | 
			self 
				greaseDeprecatedApi: 'WAExceptionFunctionalTest>>#raiseDeprecated'
				details: 'Test render phase deprecation.'.
			html paragraph: 'To be displayed' ]
		onAnswer: [ ]
]

{ #category : #actions }
WAExceptionFunctionalTest >> raiseError [
	| result |
	result := self error: 'Test Error'.
	self 
		inform: 'Signalling the error returned: ' , result greaseString
		onAnswer: [ ]
]

{ #category : #actions }
WAExceptionFunctionalTest >> raiseHalt [
	| context |
	self halt.
	"You should be able to step over the following line and have the current request context
	successfully stored in the variable.
	You should also (ideally anyway, it works on Squeak) be able to Inspect the value of
	'self requestContext' in the Debugger and get a result.
	Finally, you should be able to restart this method in the Debugger and do the above
	again successfully."
	context := self requestContext.
	self inform: 'To be displayed' onAnswer: [ ]
]

{ #category : #actions }
WAExceptionFunctionalTest >> raiseResumable [
	1 / 0.
	self inform: 'To be displayed' onAnswer: [ ]
]

{ #category : #actions }
WAExceptionFunctionalTest >> raiseWarning [
	self notify: 'Test Warning'.
	self inform: 'To be displayed' onAnswer: [ ]
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderContentOn: html [
	html div class: 'errorTest'; with: [
		self renderHandlerConfigurationOn: html.
		self renderPartsOn: html ]
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderDeprecatedOn: html [ 
	html heading: 'Deprecated'.
	html paragraph: 'The link should cause a deprecated warning to appear in the toolbar. Clicking on the link should display a single action and a single render deprecation.'.
	html anchor
		callback: [ self raiseDeprecated ];
		with: 'Raise deprecated'
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderErrorOn: html [ 
	html heading: 'Error'.
	html paragraph: 'Behaviour is exception-handler-dependent. If a Debugger is opened, closing the debugger window should at least result in the socket being closed and should not lock the session. Proceeding from the Debugger should be handled gracefully but behaviour is platform-dependent. On Pharo and GemStone, you should see an error page in the browser. On VW, you should see a message indicating that nil was returned.'.
	html anchor
		callback: [ self raiseError ];
		with: 'Raise error'
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderHaltOn: html [ 
	html heading: 'Halt'.
	html paragraph: 'Behaviour is handler-dependent. In most cases, a Debugger should open in in the image. There are comments in the #raiseHalt method suggesting other things that should be tested from within the Debugger. Clicking on proceed should display the information message "To be displayed".'.
	html anchor
		callback: [ self raiseHalt ];
		with: 'Halt execution'
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderHandlerConfigurationOn: html [
	| attribute filter |
	filter := self exceptionFilter.
	filter isNil ifTrue: [
		html paragraph: 'Exception handler configuration attribute not found!'.
		^ self ].
	attribute := filter configuration attributeAt: #exceptionHandler.

	html form: [
		html div: [
			html select
				beOptional;
				optionalLabel: '(inherited default)';
				list: attribute options asArray;
				selected: (filter configuration at: attribute key);
				callback: [ :value | 
					value isNil
						ifTrue: [ filter configuration removeExpressionAt: attribute key ifAbsent: [ ] ]
						ifFalse: [ filter configuration takeValue: value forAttribute: attribute ] ].
			html submitButton with: 'Set Handler' ] ]
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderPartsOn: html [
	self renderHaltOn: html.
	self renderErrorOn: html.
	self renderPostErrorOn: html.
	self renderRenderErrorOn: html.
	self renderResumableErrorOn: html.
	self renderWarningOn: html.
	self renderDeprecatedOn: html
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderPostErrorOn: html [ 
	html heading: 'POST Error'.
	html paragraph: 'Behaviour should be like ''Error''.'.
	html form
		post;
		with: [
			html button
				callback: [ self raiseError ];
			with: 'Raise error' ]
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderRenderErrorOn: html [
	"This is really hacky. We're trying to avoid depending on Flow here. Don't try this
	at home kids."
	renderError ifTrue: [
		"To fix the 'bug' evaluate the line below
		renderError := false. "
		self error: 'Error during rendering.' ].
	
	html heading: 'Error During Rendering'.
	html paragraph: 'This will trigger an error during the next render phase.'.
	html anchor
		callback: [ renderError := true ];
		with: 'Raise error'
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderResumableErrorOn: html [ 
	html heading: 'Resumable error'.
	html paragraph: 'Behaviour is handler-dependent. If a Debugger is opened, clicking on proceed should display the message "To be displayed".'.
	html anchor
		callback: [ self raiseResumable ];
		with: 'Raise zero divide'
]

{ #category : #rendering }
WAExceptionFunctionalTest >> renderWarningOn: html [ 
	html heading: 'Warning'.
	html paragraph: 'In Pharo and GemStone the warning test works the same as the resumable error test.'.
	html paragraph: 'In VisualWorks the warning test works the same as the halt test.'.
	html anchor
		callback: [ self raiseWarning ];
		with: 'Raise warning'
]
