Class {
	#name : 'JQAjaxInternalCallback',
	#superclass : 'JQAjaxAbstractInternalCallback',
	#instVars : [
		'block'
	],
	#category : 'JQuery-Core-Objects',
	#package : 'JQuery-Core',
	#tag : 'Objects'
}

{ #category : 'instance creation' }
JQAjaxInternalCallback class >> block: block [

	^ self basicNew initializeWithBlock: block

]

{ #category : 'initialization' }
JQAjaxInternalCallback >> initializeWithBlock: initialBlock [

	self initialize.
	block := initialBlock.

]

{ #category : 'processing' }
JQAjaxInternalCallback >> process [

	block value

]
