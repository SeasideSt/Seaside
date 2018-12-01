Class {
	#name : #PTAjax,
	#superclass : #PTPrototype,
	#instVars : [
		'url',
		'callback'
	],
	#category : 'Prototype-Core-Ajax'
}

{ #category : #parameters }
PTAjax >> addParameter: anObject [
	"Add the request parameter anObject, a single value or an association."

	self parameters add: anObject
]

{ #category : #parameters }
PTAjax >> addParameters: aCollection [
	"Add multiple request parameters from aCollection."

	self parameters addAll: aCollection associations
]

{ #category : #options }
PTAjax >> asynchronous: aBoolean [
	"Determines whether XMLHttpRequest is used asynchronously or not. Since synchronous usage is rather unsettling, and usually bad taste, you should avoid changing this. Seriously."

	self optionAt: 'asynchronous' put: aBoolean
]

{ #category : #callbacks }
PTAjax >> callback: aBlock [
	"Register aBlock as a primary callback of the receiver. It only makes sense to have a single primary callback registered per instance. Depending on the actual instance, aBlock is evaluated differently. See #processOn: for details.
	
	- SURequest: aBlock does not expect any arguments.
	- SUEvaluator: aBlock expects one argument, which will be an instance of JSScript.
	- SUUpdater: aBlock expects one argument, which will be a renderer."
	
	callback := aBlock fixCallbackTemps
]

{ #category : #callbacks }
PTAjax >> callback: aBlock value: anObject [
	"Register aBlock as a secondary callback. anObject is interpreted as JavaScript on the client-side, the result will be sent back to the server and passed into aBlock. Multiple secondary callbacks can be defined with one receiver."

	aBlock argumentCount = 1
		ifFalse: [ self error: 'aBlock expects one argument' ].
	self addParameter: (self renderContext callbacks
		store: (WAValueCallback on: aBlock)) 
			-> anObject
]

{ #category : #options }
PTAjax >> contentType: aString [
	"The Content-Type header for your request. You might want to send XML instead of the regular URL-encoded format, in which case you would have to change this."

	self optionAt: 'contentType' put: aString
]

{ #category : #private }
PTAjax >> defaultArguments [
	^ (Array with: self url) , super defaultArguments
]

{ #category : #private }
PTAjax >> defaultContentType [
	^ self application contentType
]

{ #category : #options }
PTAjax >> encoding: aString [
	"The encoding for your request contents. It is best left as is, but should weird encoding issues arise, you may have to tweak it in accordance with other encoding-related parts of your page code and server side."

	self optionAt: 'encoding' put: aString
]

{ #category : #options }
PTAjax >> evalJs: aBoolean [
	"Automatically evals the content of Ajax.Response#responseText if the content-type returned by the server is one of the following: application/ecmascript, application/javascript, application/x-ecmascript, application/x-javascript, text/ecmascript, text/javascript, text/x-ecmascript, or text/x-javascript and the request obeys SOP. If you need to force evalutation, pass 'force'. To prevent it altogether, pass false."

	self options at: 'evalJS' put: aBoolean
]

{ #category : #options }
PTAjax >> evalJson: aBoolean [
	"Automatically evals the content of Ajax.Response#responseText and populates Ajax.Response#responseJSON with it if the content-type returned by the server is set to application/json. If the request doesn't obey SOP, the content is sanitized before evaluation. If you need to force evalutation, pass 'force'. To prevent it altogether, pass false."

	self options at: 'evalJSON' put: aBoolean
]

{ #category : #initialization }
PTAjax >> initialize [
	super initialize.
	self create
]

{ #category : #options }
PTAjax >> method: aString [
	"The HTTP method to use for the request. The other widespread possibility is 'get'."

	self optionAt: 'method' put: aString
]

{ #category : #callbacks }
PTAjax >> on: aSelector of: anObject [ 
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSelector)
]

{ #category : #callbacks }
PTAjax >> on: aSelector of: anObject value: anotherObject [ 
	self 
		callback: (GRDelayedSend 
				receiver: anObject
				selector: aSelector)
		value: anotherObject
]

{ #category : #events }
PTAjax >> onComplete: anObject [
	"Triggered at the very end of a request's life-cycle, once the request completed, status-specific callbacks were called, and possible automatic behaviors were processed."

	self optionAt: 'onComplete' put: anObject asFunction
]

{ #category : #events }
PTAjax >> onCreate: anObject [
	"Triggered when the Ajax.Request object is initialized. This is after the parameters and the URL have been processed, but before first using the methods of the XHR object."

	self optionAt: 'onCreate' put: anObject asFunction
]

{ #category : #events }
PTAjax >> onException: anObject [
	"Triggered whenever an XHR error arises. Has a custom signature: the first argument is the requester, the second is the exception object."

	self optionAt: 'onException' put: anObject asFunction
]

{ #category : #events }
PTAjax >> onFailure: anObject [
	"Invoked when a request completes and its status code exists but is not in the 2xy family. This is skipped if a code-specific callback is defined, and happens before onComplete."

	self optionAt: 'onFailure' put: anObject asFunction
]

{ #category : #events }
PTAjax >> onInteractive: anObject [
	"(Not guaranteed) Triggered whenever the requester receives a part of the response (but not the final part), should it be sent in several packets."

	self optionAt: 'onInteractive' put: anObject asFunction
]

{ #category : #events }
PTAjax >> onLoaded: anObject [
	"(Not guaranteed) Triggered once the underlying XHR object is setup, the connection open, and ready to send its actual request."

	self optionAt: 'onLoaded' put: anObject asFunction
]

{ #category : #events }
PTAjax >> onLoading: anObject [
	"(Not guaranteed) Triggered when the underlying XHR object is being setup, and its connection opened."

	self optionAt: 'onLoading' put: anObject asFunction
]

{ #category : #events }
PTAjax >> onStatus: anInteger do: anObject [ 
	"With anInteger being an HTTP status code for the response. Invoked when the response just completed, and the status code is exactly the one we used in the callback name. Prevents execution of onSuccess / onFailure. Happens before onComplete."
	self 
		optionAt: 'on' , anInteger greaseString
		put: anObject asFunction
]

{ #category : #events }
PTAjax >> onSuccess: anObject [
	"Invoked when a request completes and its status code is undefined or belongs in the 2xy family. This is skipped if a code-specific callback is defined, and happens before onComplete."

	self optionAt: 'onSuccess' put: anObject asFunction
]

{ #category : #events }
PTAjax >> onUninitialized: anObject [
	"(Not guaranteed) Invoked when the XHR object was just created."

	self optionAt: 'onUninitialized' put: anObject asFunction
]

{ #category : #parameters }
PTAjax >> parameters [
	"Answer the request parameters of the reciever."

	^ (self options at: 'parameters' ifAbsentPut: [ JSJoin new ]) collection
]

{ #category : #processing }
PTAjax >> process [
	self processWith: nil
]

{ #category : #processing }
PTAjax >> processOn: aStream with: argumentString [
	self subclassResponsibility
]

{ #category : #processing }
PTAjax >> processWith: argumentString [
	self requestContext respond: [ :response |
		response 
			doNotCache; 
			contentType: self defaultContentType.
		self processOn: response stream with: argumentString ]
]

{ #category : #initialization }
PTAjax >> registerCallbackIn: aCallbackStore [
	self addParameter: (aCallbackStore store: (JSAjaxCallback on: [ self process ]))
]

{ #category : #options }
PTAjax >> requestHeaders: aDictionary [
	"Prototype automatically provides a set of default headers, that this option can override and augment: X-Requested-With, X-Prototype-Version, Accept, and Content-type."

	self optionAt: 'requestHeaders' put: aDictionary
]

{ #category : #options }
PTAjax >> sanitizeJson: aBoolean [
	"Sanitizes the content of Ajax.Response#responseText before evaluating it."

	self options at: 'sanitizeJSON' put: aBoolean
]

{ #category : #initialization }
PTAjax >> setContext: aRenderContext [
	super setContext: aRenderContext.
	self url: aRenderContext actionUrl withoutQuery withoutFragment.
	self addParameters: aRenderContext actionUrl queryFields.
	self registerCallbackIn: aRenderContext callbacks
]

{ #category : #triggers }
PTAjax >> triggerArgument: anInteger callback: aBlock [
	"Triggers a JavaScript function argument and passes its value into aBlock."

	self callback: aBlock value: (JSStream argument: anInteger)
]

{ #category : #triggers }
PTAjax >> triggerForm: aString [
	"Serialize a complete from and trigger all its associated callbacks. Note that the callbacks of submit buttons are ignored to preserve consistency, use the normal callback to trigger specific code evaluation."

	self addParameter: (PTForm new
		id: aString;
		serialize)
]

{ #category : #triggers }
PTAjax >> triggerFormElement: aString [
	"Serializing a form element and trigger its associated callback. Note that this might not work for all form elements as one would expect: (1) check-boxes and multi-select lists do not work as Seaside internally depends on other hidden form elements. (2) submit-button callbacks are ignored, instead use the normal callback to trigger specific code evaluation."

	self addParameter: (PTFormElement new
		id: aString;
		serialize)
]

{ #category : #triggers }
PTAjax >> triggerPassenger: aBlock [
	aBlock fixCallbackTemps.
	self
		callback: [ :value | aBlock value: (self renderContext callbacks passengerAt: value) ]
		value: (JSStream on: 'arguments[0].id')
]

{ #category : #accessing }
PTAjax >> url [
	^ url
]

{ #category : #accessing }
PTAjax >> url: aString [
	url := aString
]
