Class {
	#name : #JQueryClass,
	#superclass : #JQuery,
	#category : 'JQuery-Core-Objects'
}

{ #category : #ajax }
JQueryClass >> ajax [
	"Perform an asynchronous HTTP (Ajax) request."
	
	^ self create: JQAjax
]

{ #category : #ajax }
JQueryClass >> ajaxSetup [
	"Set default values for future Ajax requests."

	^ self create: JQAjaxSetup
]

{ #category : #convenience }
JQueryClass >> all [
	"Answer a jQuery object that matches all DOM elements."
	
	^ self expression: '*'
]

{ #category : #convenience }
JQueryClass >> class: aString [ 
	"Answer a jQuery that matches all DOM elements with the CLASS aString."

	^ self expression: '.' , aString greaseString
]

{ #category : #utilities }
JQueryClass >> contains: anObject in: aContainer [
	"Check to see if a DOM node is within another DOM node."
	
	self call: 'contains' with: aContainer with: anObject
]

{ #category : #convenience }
JQueryClass >> document [
	"Answer a jQuery object with the document DOM element."
	
	^ self expression: (JSStream on: 'document')
]

{ #category : #utilities }
JQueryClass >> error: aString [
	"Takes a string and throws an exception containing it."
	
	self call: 'error' with: aString
]

{ #category : #utilities }
JQueryClass >> escapeSelector: aString [
	"Escapes any character that has a special meaning in a CSS selector."
	
	self call: 'escapeSelector' with: aString
]

{ #category : #creation }
JQueryClass >> event [
	"Create a new jQuery.Event to be used in an event handler."

	^ JQEvent context: self renderContext
]

{ #category : #creation }
JQueryClass >> event: aString [
	"Create a new jQuery.Event object without the new operator."

	^ self event alias: (self call: 'Event' with: aString) greaseString
]

{ #category : #creation }
JQueryClass >> expression: aString [
	"This function accepts a string containing a CSS selector which is then used to match a set of elements."

	^ self expression: aString context: nil
]

{ #category : #creation }
JQueryClass >> expression: aString context: anObject [
	"This function accepts a string containing a CSS selector which is then used to match a set of elements."
	
	^ (JQueryInstance
		context: self renderContext
		constructor: (anObject isNil
			ifTrue: [ Array with: aString ]
			ifFalse: [ Array with: aString with: anObject ]))
				rendererClass: self rendererClass;
				yourself
]

{ #category : #ajax }
JQueryClass >> get [
	"Load a remote page using an HTTP GET request."
	
	^ self create: JQGet
]

{ #category : #ajax }
JQueryClass >> getJson [
	"Load JSON data using an HTTP GET request."
	
	^ self create: JQGetJson
]

{ #category : #ajax }
JQueryClass >> getScript [
	"Loads, and executes, a local JavaScript file using an HTTP GET request."
	
	^ self create: JQGetScript
]

{ #category : #utilities }
JQueryClass >> holdReady: aBoolean [
	"Holds or releases the execution of jQuery's ready event."
	
	self call: 'holdReady' with: aBoolean
]

{ #category : #creation }
JQueryClass >> html: aRenderable [
	"Create DOM elements on-the-fly from the provided String of raw HTML."

	^ self expression: (self render: aRenderable)
]

{ #category : #convenience }
JQueryClass >> id: aString [ 
	"Answer a jQuery with a single DOM element identified by the ID aString."

	^ self expression: '#' , aString greaseString
]

{ #category : #utilities }
JQueryClass >> isEmptyObject: anObject [
	"Check to see if an object is empty (contains no properties)."
	
	self call: 'isEmptyObject' with: anObject
]

{ #category : #utilities }
JQueryClass >> isPlainObject: anObject [
	"Check to see if an object is a plain object (created using {} or new Object)."
	
	self call: 'isPlainObject' with: anObject
]

{ #category : #utilities }
JQueryClass >> isWindow: anObject [
	"Determine whether the argument is a window."
	
	self call: 'isWindow' with: anObject
]

{ #category : #creation }
JQueryClass >> new [
	"Wrap jQuery functionality around this DOM Element."

	^ self expression: JSStream this
]

{ #category : #accessing }
JQueryClass >> noop [
	"An empty function."
	
	self access: 'noop'
]

{ #category : #utilities }
JQueryClass >> parseJSON: aString [
	"Takes a well-formed JSON string and returns the resulting JavaScript object."
	self 
		greaseDeprecatedApi: 'JQueryClass>>#parseJSON'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-jquery-parsejson'.
	
	self call: 'parseJSON' with: aString
]

{ #category : #ajax }
JQueryClass >> post [
	"Load a remote page using an HTTP POST request."
	
	^ self create: JQPost
]

{ #category : #creation }
JQueryClass >> ready: anObject [
	"Binds a function to be executed whenever the DOM is ready to be traversed and manipulated. Note: Do not combine the jQuery ready-function and the Seaside mechanism (WAHtmlDocument>>#addLoadScript:) to add load-scripts. The queues of these two mechanisms are independent and conflict with each other. The execution order of the scripts is undefined. Preferably use the mechanism of Seaside: it transfers less bytes over the network and reliably works for full requests and AJAX callbacks."

	^ self expression: anObject asFunction
]

{ #category : #agent }
JQueryClass >> support [
	"A collection of properties that represent the presence of different browser features or bugs."
	
	self access: 'support'
]

{ #category : #convenience }
JQueryClass >> this [
	"Answer a jQuery object of the receiving DOM element."
	
	^ self new
]

{ #category : #utilities }
JQueryClass >> type: anObject [
	"Determine the internal JavaScript [[Class]] of an object."
	
	self call: 'type' with: anObject
]

{ #category : #utilities }
JQueryClass >> unique: anArray [
	"Create a copy of an array of DOM elements with the duplicates removed. Note that this only works on arrays of DOM elements, not strings or numbers."
	
	self call: 'unique' with: anArray
]

{ #category : #utilities }
JQueryClass >> uniqueSort: anArray [
	"Create a copy of an array of DOM elements with the duplicates removed. Note that this only works on arrays of DOM elements, not strings or numbers."
	
	self call: 'uniqueSort' with: anArray
]

{ #category : #convenience }
JQueryClass >> with: anObject [
	"Convenience method that answers a jQuery (instance) object. Pass it a symbol to reference an DOM id, a block to render new HTML nodes, a javascript object to be run at load time or a string to be used as a CSS query."
	
	anObject isNil
		ifTrue: [ ^ self new ].
	anObject isSymbol
		ifTrue: [ ^ self id: anObject ].
	anObject isBlock
		ifTrue: [ ^ self html: anObject ].
	anObject isJavascript
		ifTrue: [ ^ self ready: anObject ].
	^ self expression: anObject
]
