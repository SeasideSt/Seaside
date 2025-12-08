"
Abstract superclass for partial and regular continuations.
"
Class {
	#name : 'WAAbstractContinuation',
	#superclass : 'GRObject',
	#category : 'Seaside-Continuation',
	#package : 'Seaside-Continuation'
}

{ #category : 'testing' }
WAAbstractContinuation class >> isAbstract [ 

	^ self == WAAbstractContinuation
]

{ #category : 'accessing' }
WAAbstractContinuation >> numArgs [
	self subclassResponsibility
]

{ #category : 'evaluating' }
WAAbstractContinuation >> value [
	self subclassResponsibility
]

{ #category : 'evaluating' }
WAAbstractContinuation >> value: anObject [
	self subclassResponsibility
]

{ #category : 'evaluating' }
WAAbstractContinuation >> valueWithArguments: anArray [
	self subclassResponsibility
]

{ #category : 'evaluating' }
WAAbstractContinuation >> valueWithPossibleArguments: anArray [
	self subclassResponsibility
]
