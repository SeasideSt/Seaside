Class {
	#name : 'JQAjaxInternalCallbackRespondJSON',
	#superclass : 'JQAjaxAbstractInternalCallback',
	#instVars : [
		'renderable'
	],
	#category : 'JQuery-JSON',
	#package : 'JQuery-JSON'
}

{ #category : 'instance creation' }
JQAjaxInternalCallbackRespondJSON class >> renderable: renderable [

	^ self basicNew initializeWithRenderable: renderable

]

{ #category : 'initialization' }
JQAjaxInternalCallbackRespondJSON >> initializeWithRenderable: initialRenderable [

	self initialize.
	renderable := initialRenderable.

]

{ #category : 'processing' }
JQAjaxInternalCallbackRespondJSON >> process [

	self requestContext respond: [ :response |
		response
			doNotCache;
			contentType: WAMimeType applicationJson;
			nextPutAll: (WAJsonCanvas builder render: renderable) ]

]
