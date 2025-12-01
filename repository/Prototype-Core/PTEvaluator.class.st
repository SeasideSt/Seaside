"
Initiates and processes an AJAX request. It automatically injects the JavaScript generated during the callback into the page.
"
Class {
	#name : 'PTEvaluator',
	#superclass : 'PTRequest',
	#category : 'Prototype-Core-Ajax',
	#package : 'Prototype-Core',
	#tag : 'Ajax'
}

{ #category : 'private' }
PTEvaluator >> defaultContentType [
	^ WAMimeType textJavascript charset: self requestContext handler charSet
]

{ #category : 'processing' }
PTEvaluator >> processOn: aStream with: unused [
	callback isNil
		ifFalse: [ self script: callback on: aStream ]
]
