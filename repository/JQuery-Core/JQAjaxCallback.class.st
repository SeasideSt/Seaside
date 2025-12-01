Class {
	#name : 'JQAjaxCallback',
	#superclass : 'WACallback',
	#instVars : [
		'ajax'
	],
	#category : 'JQuery-Core',
	#package : 'JQuery-Core'
}

{ #category : 'instance creation' }
JQAjaxCallback class >> ajax: ajax [

	^ self basicNew initializeWithAjax: ajax

]

{ #category : 'evaluation' }
JQAjaxCallback >> evaluateWithArgument: anObject [

	ajax processCallback.
	self requestContext
		respond: [ :response | response doNotCache ]

]

{ #category : 'initialization' }
JQAjaxCallback >> initializeWithAjax: initialAjax [

	self initialize.
	ajax := initialAjax.

]

{ #category : 'accessing' }
JQAjaxCallback >> priority [

	^ 5

]
