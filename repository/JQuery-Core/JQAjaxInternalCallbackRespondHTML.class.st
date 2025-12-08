Class {
	#name : 'JQAjaxInternalCallbackRespondHTML',
	#superclass : 'JQAjaxAbstractInternalCallback',
	#instVars : [
		'ajax',
		'renderable'
	],
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'instance creation' }
JQAjaxInternalCallbackRespondHTML class >> ajax: ajax renderable: renderable [

	^ self basicNew initializeWithAjax: ajax renderable: renderable

]

{ #category : 'initialization' }
JQAjaxInternalCallbackRespondHTML >> initializeWithAjax: initialAjax renderable: initialRenderable [

	self initialize.
	ajax := initialAjax.
	renderable := initialRenderable.

]

{ #category : 'processing' }
JQAjaxInternalCallbackRespondHTML >> process [

	self requestContext respond: [ :response |
		response
			doNotCache;
			contentType: self application contentType.
		ajax render: renderable on: response stream ]

]
