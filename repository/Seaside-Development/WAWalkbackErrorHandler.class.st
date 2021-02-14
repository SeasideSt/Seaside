"
I am the default development error handler that displays the stack frames and adds the option to display a debugger.

I delegate the rendering to WAWalkback.

This handler uses Components and depends on having a valid Session. If an error occurs outside of the Session scope it will simply use the superclass behaviour, which should be to open a debugger.
"
Class {
	#name : #WAWalkbackErrorHandler,
	#superclass : #WADebugErrorHandler,
	#classInstVars : [
		'configuredExceptionHandlingDefaults'
	],
	#category : 'Seaside-Development-Core'
}

{ #category : #'class initialization' }
WAWalkbackErrorHandler class >> configureApplicationExceptionHandlingDefaults [
	(configuredExceptionHandlingDefaults ifNil: [ false ]) ifFalse: [
		WAAdmin applicationExceptionHandlingDefaults
			at: #exceptionHandler put: self.
		configuredExceptionHandlingDefaults := true ]
]

{ #category : #'class initialization' }
WAWalkbackErrorHandler class >> initialize [
	self configureApplicationExceptionHandlingDefaults
]

{ #category : #actions }
WAWalkbackErrorHandler >> handleDefault: anException [
	^ self open: anException
]

{ #category : #actions }
WAWalkbackErrorHandler >> open: anException [ 
	self requestContext request isXmlHttpRequest
		ifTrue: [ ^ super open: anException ].

	self shouldCall
		ifTrue: [ self openUsingCall: anException ]
		ifFalse: [ self openUsingDirectRendering: anException ]
]

{ #category : #actions }
WAWalkbackErrorHandler >> openUsingCall: anException [
	"If an error occurs trying to display the walkback component, we just use the super
	behaviour, which should be to open a debugger.."
	| answer |
	answer := true.
	[ self session isNil ifFalse:  [
		answer := self session presenter call: (WAWalkback current exception: anException).
		"Exception handlers hold the request context because they are used in places where
		the dynamic variable is not present. Since this particular class depends on RenderLoop,
		however, it will be present and we need to update the stored value after doing a call."
		requestContext := WACurrentRequestContext value ] ] 
		on: Error
		do: [ :err | answer := true ].
	answer ifTrue: [ super open: anException ]
]

{ #category : #actions }
WAWalkbackErrorHandler >> openUsingDirectRendering: anException [
	| debugAction |
	"we pressed the debug link,
	we intentionally don't reset otherwise we'd loose the response
	up to now when proceed is pressed in the debugger"
	debugAction := self requestContext request at: '_debugAction' ifAbsent: [ nil ].
	debugAction = '_debug'
		ifTrue: [ ^ super open: anException ].
	debugAction = '_proceed'
		ifTrue: [ ^ self basicResume: anException ].
	self requestContext response resetIfPossible
		ifTrue: [
			| fullStack renderer |
			fullStack := debugAction = '_fullStack'.
			
			renderer := WAWalkback current exception: anException.
			fullStack ifTrue: [ renderer showFullStack ].
			
			self requestContext respond: [ :response  |
				"set to HTML and set encoding"
				response
					contentType: self application contentType;
					nextPutAll: (WAHtmlCanvas builder
						fullDocument: true;
						rootBlock: [ :root | renderer updateRoot: root ];
						render: renderer)  ] ]
		ifFalse: [
			"we could not reset the response so we just open a debugger (similar to XmlHttpRequest)"
			super open: anException ]
]

{ #category : #private }
WAWalkbackErrorHandler >> shouldCall [
	"WAWalkback would like to resubmit the same URL with different parameters.
	This doesn't for POST (we lose the request body) so we #call: in these cases."
	^ self session notNil
		and: [ self requestContext request isPost ]
]
