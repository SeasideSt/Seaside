Class {
	#name : 'JQAjaxInternalCallbackRespond',
	#superclass : 'JQAjaxAbstractInternalCallback',
	#instVars : [
		'block'
	],
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'instance creation' }
JQAjaxInternalCallbackRespond class >> block: block [

	^ self basicNew initializeWithBlock: block

]

{ #category : 'initialization' }
JQAjaxInternalCallbackRespond >> initializeWithBlock: initialBlock [

	self initialize.
	block := initialBlock.

]

{ #category : 'processing' }
JQAjaxInternalCallbackRespond >> process [

	self requestContext respond: block

]
