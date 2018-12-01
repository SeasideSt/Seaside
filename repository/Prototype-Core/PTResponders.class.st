"
A repository of global listeners notified about every step of Prototype-based AJAX requests.
"
Class {
	#name : #PTResponders,
	#superclass : #PTNamed,
	#category : 'Prototype-Core-Ajax'
}

{ #category : #private }
PTResponders >> defaultArguments [
	^ Array with: self options
]

{ #category : #private }
PTResponders >> defaultMethod [
	^ 'register'
]

{ #category : #private }
PTResponders >> defaultPrototype [
	^ 'Ajax.Responders'
]

{ #category : #events }
PTResponders >> onComplete: anObject [
	"Triggered at the very end of a request's life-cycle, once the request completed, status-specific callbacks were called, and possible automatic behaviors were processed."

	self optionAt: 'onComplete' put: anObject asFunction
]

{ #category : #events }
PTResponders >> onCreate: anObject [
	"onCreate is only available to responders, as it wouldn't make a lot of sense to individual requests: you do know when your code creates them, don't you?"

	self optionAt: 'onCreate' put: anObject asFunction
]

{ #category : #events }
PTResponders >> onException: anObject [
	"Triggered whenever an XHR error arises. Has a custom signature: the first argument is the requester, the second is the exception object."

	self optionAt: 'onException' put: anObject asFunction
]

{ #category : #events }
PTResponders >> onFailure: anObject [
	"Invoked when a request completes and its status code exists but is not in the 2xy family. This is skipped if a code-specific callback is defined, and happens before onComplete."

	self optionAt: 'onFailure' put: anObject asFunction
]

{ #category : #events }
PTResponders >> onInteractive: anObject [
	"(Not guaranteed) Triggered whenever the requester receives a part of the response (but not the final part), should it be sent in several packets."

	self optionAt: 'onInteractive' put: anObject asFunction
]

{ #category : #events }
PTResponders >> onLoaded: anObject [
	"(Not guaranteed) Triggered once the underlying XHR object is setup, the connection open, and ready to send its actual request."

	self optionAt: 'onLoaded' put: anObject asFunction
]

{ #category : #events }
PTResponders >> onLoading: anObject [
	"(Not guaranteed) Triggered when the underlying XHR object is being setup, and its connection opened."

	self optionAt: 'onLoading' put: anObject asFunction
]

{ #category : #events }
PTResponders >> onStatus: anInteger do: anObject [ 
	"With anInteger being an HTTP status code for the response. Invoked when the response just completed, and the status code is exactly the one we used in the callback name. Prevents execution of onSuccess / onFailure. Happens before onComplete."
	self 
		optionAt: 'on' , anInteger greaseString
		put: anObject asFunction
]

{ #category : #events }
PTResponders >> onSuccess: anObject [
	"Invoked when a request completes and its status code is undefined or belongs in the 2xy family. This is skipped if a code-specific callback is defined, and happens before onComplete."

	self optionAt: 'onSuccess' put: anObject asFunction
]

{ #category : #events }
PTResponders >> onUninitialized: anObject [
	"(Not guaranteed) Invoked when the XHR object was just created."

	self optionAt: 'onUninitialized' put: anObject asFunction
]

{ #category : #actions }
PTResponders >> register [
	method := 'register'
]

{ #category : #actions }
PTResponders >> unregister [
	method := 'unregister'
]
