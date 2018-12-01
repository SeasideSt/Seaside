"
Load a remote page using an HTTP request.
"
Class {
	#name : #JQAjax,
	#superclass : #JQAjaxSetup,
	#instVars : [
		'callback',
		'callbackId'
	],
	#category : 'JQuery-Core-Objects'
}

{ #category : #parameters }
JQAjax >> addParameter: anObject [
	"Add the request parameter anObject, a single value or an association."

	self parameters add: anObject
]

{ #category : #parameters }
JQAjax >> addParameters: aCollection [
	"Add multiple request parameters from aCollection."

	self parameters addAll: aCollection associations
]

{ #category : #callbacks }
JQAjax >> callback: aBlock [
	"Register aBlock as a primary callback of the receiver. It is only possible to have a single primary callback registered per instance. The primary callback must generate a response."

	self enableCallbacks.
	callback := aBlock fixCallbackTemps
]

{ #category : #callbacks }
JQAjax >> callback: aBlock value: anObject [
	"Register aBlock as a secondary callback. anObject is a reference to a Javascript object on the client-side. The object will be sent back to the server as a string and passed into aBlock. Multiple secondary callbacks can be defined with one receiver.

Note: anObject should be a single literal Javascript object (String, Number, Boolean). The object is transfered from client to server as the print-string of the object and passed into the callback block as a Smalltalk String."

	self enableCallbacks.
	self addParameter: (self renderContext callbacks
		store: (WAValueCallback on: aBlock)) 
			-> anObject
]

{ #category : #accessing }
JQAjax >> data [
	^ self options at: 'data' ifAbsentPut: [ JSJoin new ]
]

{ #category : #private }
JQAjax >> enableCallbacks [
	self hasCallback ifTrue: [ ^ self ].
	self url: self renderContext actionUrl withoutQuery withoutFragment.
	self addParameters: self renderContext actionUrl queryFields.
	self addParameter: (callbackId := self renderContext callbacks
		store: (JSAjaxCallback on: [ self processCallback ]))
]

{ #category : #'accessing-urls' }
JQAjax >> fullUrl [
	"Answer a Seaside URL object that is composed with the parameters of the receiver. This method excludes dynamic Javascript objects that might be part of the parameters."
	
	| url |
	url := self url copy.
	self parameters do: [ :each | 
		(each isString)
			ifTrue: [ url addField: each ].
		((each isKindOf: Association) and: [ each value isJavascript not ])
			ifTrue: [ url addField: each key value: each value ] ].
	^ url
]

{ #category : #private }
JQAjax >> hasCallback [
	^ callbackId notNil
]

{ #category : #callbacks }
JQAjax >> html: aRenderable [
	"Defines a html rendering callback."

	self dataType: 'html'.
	self respond: [ :response |
		response
			doNotCache;
			contentType: self application contentType.
		self render: aRenderable on: response stream ]
]

{ #category : #options }
JQAjax >> isSupportedOption: aString [
	^ true
]

{ #category : #'accessing-urls' }
JQAjax >> javascriptUrl [
	"Answer a Javascript expression that evaluates to the URL with all parameters attached."

	| stream |
	stream := JSStream new.
	stream javascript: self url.
	self data collection isEmpty ifFalse: [
		stream nextPutAll: '+"'.
		stream nextPut: (self url queryFields isEmpty
			ifTrue: [ $? ] ifFalse: [ $& ]).
		stream nextPutAll: '"+'; javascript: self data ].
	^ stream
]

{ #category : #accessing }
JQAjax >> method [
	^ 'ajax'
]

{ #category : #options }
JQAjax >> optionAt: aKey put: aValue [
	^ (self isSupportedOption: aKey) 
		ifTrue: [ super optionAt: aKey put: aValue ]
		ifFalse: [ self error: 'The option ' , aKey printString , ' is not supported in ' , self class name , '. Either use #ajaxSetup to configure default values, or the more powerful version with #ajax.' ]
]

{ #category : #parameters }
JQAjax >> parameters [
	"Answer the request parameters of the reciever."
	
	^ self data collection
]

{ #category : #private }
JQAjax >> processCallback [
	callback isNil
		ifFalse: [ callback value ]
]

{ #category : #callbacks }
JQAjax >> respond: aBlock [
	"Defines a response callback."

	self callback: [ self requestContext respond: aBlock ]
]

{ #category : #callbacks }
JQAjax >> script: aBlock [
	"Defines a script rendering callback."

	self dataType: 'script'.
	self respond: [ :response |
		response
			doNotCache; 
			contentType: (WAMimeType textJavascript
				charset: self requestContext handler charSet).
		self script: aBlock on: response stream ]
]

{ #category : #convenience }
JQAjax >> serialize: aQuery [
	"Serializes a set of input elements matching aQuery and trigger the associated Seaside callbacks."

	self enableCallbacks.
	self addParameter: aQuery serialize
]

{ #category : #convenience }
JQAjax >> serializeChildren [
	"Serialize all input fields contained in the receiving element."
	
	self serializeChildren: self jQuery this
]

{ #category : #convenience }
JQAjax >> serializeChildren: aQuery [
	"Serialize all input fields being children of aQuery."

	self serialize: (aQuery find: ':input')
]

{ #category : #convenience }
JQAjax >> serializeFileUpload: aQuery [

	"Upload the file in the field identified by aQuery using FormData. Cannot be composed with any other callback."
	
	self
		data:
			((((JSStream on: 'var formdata = new FormData()'),
			 ((aQuery copy attributeAt: 'name') assignLocalTo: 'name'),
			 (((aQuery property: 0) access: 'files') assignLocalTo: 'files'),
			 (JSStream on:'for(i=0;i<files.length;i++) formdata.append(name,files[i])'),
			 (JSStream on: 'return formdata')) asFunction) apply: #());
		url: self renderContext actionUrl;
		type: 'POST';
		cache: false;
		processData: false;
		contentType: false
]

{ #category : #convenience }
JQAjax >> serializeForm [
	"Serialize all input fields of the form the receiving element is contained in."

	self serializeForm: self jQuery this
]

{ #category : #convenience }
JQAjax >> serializeForm: aQuery [
	"Serialize all input fields of the form matching aQuery."

	self serializeChildren: (aQuery closest: 'form')
]

{ #category : #convenience }
JQAjax >> serializeThis [
	"Serialize the receiving element. Note that this might not work for all form elements: (1) for check-boxes and multi-select lists Seaside internally depends on an additional hidden form element that is generated automatically, instead use #serializeThisWithHidden (2) submit-button callbacks are ignored, instead use a normal callback to trigger specific code evaluation."

	self serialize: self jQuery this
]

{ #category : #convenience }
JQAjax >> serializeThisWithHidden [
	"Serialize the receiving form element and a following hidden form element. This is required in case of a check-box or multi-select list."
	
	self serialize: (self jQuery this
		next: 'input:hidden';
		addBack)
]

{ #category : #convenience }
JQAjax >> serializeWithHidden: aQuery [
	"Serialize the receiving form element and a following hidden form element. This is required in case of a check-box or multi-select list."
	
	self serialize: (aQuery
		next: 'input:hidden';
		addBack)
]

{ #category : #callbacks }
JQAjax >> text: aBlock [
	"Defines a text rendering callback."

	self dataType: 'text'.
	self respond: [ :response |
		response
			doNotCache;
			contentType: (WAMimeType textPlain 
				charset: self requestContext handler charSet).
		aBlock value: response stream ]
]

{ #category : #accessing }
JQAjax >> url [
	^ self options at: 'url' ifAbsentPut: [ WAUrl new ]
]
