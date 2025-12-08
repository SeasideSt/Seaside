"
A WACurrentRequestContext is a thread local variable that points to the current WARequestContext.

"
Class {
	#name : 'WACurrentRequestContext',
	#superclass : 'WADynamicVariable',
	#category : 'Seaside-Core-RequestHandling',
	#package : 'Seaside-Core',
	#tag : 'RequestHandling'
}

{ #category : 'defaults' }
WACurrentRequestContext class >> defaultValue [
	^ WARequestContextNotFound signal
]
