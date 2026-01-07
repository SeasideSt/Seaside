Class {
	#name : 'JQAjaxInternalCallbackRespondScript',
	#superclass : 'JQAjaxAbstractInternalCallback',
	#instVars : [
		'ajax',
		'block'
	],
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'instance creation' }
JQAjaxInternalCallbackRespondScript class >> ajax: ajax block: block [

	^ self basicNew initializeWithAjax: ajax block: block

]

{ #category : 'initialization' }
JQAjaxInternalCallbackRespondScript >> initializeWithAjax: initialAjax block: initialBlock [

	self initialize.
	ajax := initialAjax.
	block := initialBlock.

]

{ #category : 'processing' }
JQAjaxInternalCallbackRespondScript >> process [

	self requestContext respond: [ :response |
		response
			doNotCache; 
			contentType: (WAMimeType textJavascript
				charset: self requestContext handler charSet).
		ajax script: block on: response stream ]

]
