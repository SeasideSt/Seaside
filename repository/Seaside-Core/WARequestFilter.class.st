"
WARequestFilter is an implementation for the chain-of-responsibility and decorator pattern for request handlers. Request filters are a way of hooking into the request handling. There is no limit on what they can do, examples include
 - preprocess the request
 - postprocess the response
 - set up thread locals or expection handlers
 - return a different response (eg. from cache or access denied) 

This functionality is also known as servlet filters, WSGI infrastructure or rack infrastructure.

Instance Variables:
	next	<WAValueHolder<WARequestFilter>>
		
next
	- The next filter in the chain.
"
Class {
	#name : #WARequestFilter,
	#superclass : #WAObject,
	#instVars : [
		'next'
	],
	#category : 'Seaside-Core-Filter'
}

{ #category : #copying }
WARequestFilter >> copyTo: aRequestHandler [
	^ self copy setNext: (self next copyTo: aRequestHandler)
]

{ #category : #processing }
WARequestFilter >> handleFiltered: aRequestContext [ 
	"Pass on the aRequestContext to the next filter or handler. Subclasses might override this method to customize the request and response handling."
	
	self next handleFiltered: aRequestContext
]

{ #category : #accessing }
WARequestFilter >> handler [
	"Answer the owning request handler."

	^ self next handler
]

{ #category : #initialization }
WARequestFilter >> initialize [
	super initialize.
	next := WAValueHolder new
]

{ #category : #testing }
WARequestFilter >> isExceptionFilter [
	^ false
]

{ #category : #accessing }
WARequestFilter >> next [
	"Answer the next filter or request handler."
	
	^ next contents
]

{ #category : #copying }
WARequestFilter >> postCopy [
	super postCopy.
	next := next copy
]

{ #category : #initialization }
WARequestFilter >> setNext: aFilter [
	next contents: aFilter
]
