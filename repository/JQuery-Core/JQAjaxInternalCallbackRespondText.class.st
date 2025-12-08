Class {
	#name : 'JQAjaxInternalCallbackRespondText',
	#superclass : 'JQAjaxAbstractInternalCallback',
	#instVars : [
		'block'
	],
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'instance creation' }
JQAjaxInternalCallbackRespondText class >> block: block [

	^ self basicNew initializeWithBlock: block

]

{ #category : 'initialization' }
JQAjaxInternalCallbackRespondText >> initializeWithBlock: initialBlock [

	self initialize.
	block := initialBlock.

]

{ #category : 'processing' }
JQAjaxInternalCallbackRespondText >> process [

	self requestContext respond: [ :response |
		response
			doNotCache;
			contentType: (WAMimeType textPlain 
				charset: self requestContext handler charSet).
		block value: response stream ]

]
