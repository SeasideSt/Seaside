"
A WADynamicVariable is a variable that is visible only in the stackframes outgoing from this one.

Example:

WADynamicVariable
	use: 'Seaside'
	during: [ self compilcatedCalculation ]
	
Whenever
WADynamicVariable value
gets evaluated somewhere inside [ self compilcatedCalculation ] or a method invoked directly or indirectly by it, its value will be 'Seaside'. If no #use:during: handler is around the current stack frame, then the value will be the return value of #defaultValue.

Do not use WADynamicVariable directly, instead create a subclass for each variable you want to use.
"
Class {
	#name : #WADynamicVariable,
	#superclass : #WANotification,
	#category : 'Seaside-Core-Utilities'
}

{ #category : #defaults }
WADynamicVariable class >> defaultValue [
	^ nil
]

{ #category : #evaluating }
WADynamicVariable class >> use: anObject during: aBlock [
	"Set the dynamic value of the receiver to anObject during the evaluation of aBlock."
	
	^ aBlock on: self do: [ :notification | notification resume: anObject ]
]

{ #category : #evaluating }
WADynamicVariable class >> value [
	"Answer the dynamic value of the receiver."
	
	^ self signal
]

{ #category : #defaults }
WADynamicVariable >> defaultAction [
	^ self class defaultValue
]
